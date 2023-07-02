#!/bin/sh

# 下载规则
curl -o i-4.txt https://ghproxy.com/https://raw.githubusercontent.com/217heidai/adblockfilters/main/rules/adblockfilters.txt
curl -o i-4.txt https://raw.githubusercontent.com/vokins/yhosts/master/hosts
curl -o i-4.txt https://raw.githubusercontent.com/o0HalfLife0o/list/master/ad.txt
curl -o i-4.txt https://www.i-dont-care-about-cookies.eu/abp/
curl -o i-4.txt https://adguardteam.github.io/HostlistsRegistry/assets/filter_29.txt
curl -o i-4.txt https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
curl -o i-4.txt https://raw.gitmirror.com/jerryn70/GoodbyeAds/master/Extension/GoodbyeAds-Xiaomi-Extension.txt
curl -o i-4.txt https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
curl -o i-4.txt https://raw.githubusercontent.com/jdlingyu/ad-wars/master/hosts
curl -o i-4.txt https://adaway.org/hosts.txt
curl -o i-4.txt https://easylist-downloads.adblockplus.org/easyprivacy.txt
curl -o i-4.txt https://cdn.jsdelivr.net/gh/privacy-protection-tools/anti-AD@master/anti-ad-easylist.txt
curl -o i-4.txt https://easylist-downloads.adblockplus.org/antiadblockfilters.txt
curl -o i-4.txt https://cdn.jsdelivr.net/gh/damengzhu/banad/jiekouAD.txt
curl -o i-4.txt https://www.i-dont-care-about-cookies.eu/abp/
curl -o i-4.txt https://cdn.jsdelivr.net/gh/crazy-max/WindowsSpyBlocker/data/hosts/spy.txt
curl -o i-4.txt https://cdn.jsdelivr.net/gh/o0HalfLife0o/list@master/ad-pc.txt
curl -o i-4.txt https://cdn.jsdelivr.net/gh/VeleSila/yhosts/hosts.txt
curl -o i-4.txt https://gitlab.com/quidsup/notrack-blocklists/-/raw/master/trackers.list
curl -o i-4.txt https://raw.githubusercontent.com/AdguardTeam/cname-trackers/master/combined_disguised_trackers.txt、
curl -o i-4.txt https://raw.githubusercontent.com/Crystal-RainSlide/AdditionalFiltersCN/master/CN.txt
curl -o i-4.txt https://raw.githubusercontent.com/jerryn70/GoodbyeAds/master/Formats/GoodbyeAds-AdBlock-Filter.txt
curl -o i-4.txt https://www.trli.club/ad-hosts/ad-hosts-sqlist/ad-adguardhome-dnstype.txt
curl -o i-4.txt https://raw.githubusercontent.com/Cats-Team/AdRules/main/dns.txt
curl -o i-4.txt https://cdn.jsdelivr.net/gh/blackmatrix7/ios_rule_script@master/rule/AdGuard/Advertising/Advertising.txt
curl -o i-4.txt https://raw.githubusercontent.com/217heidai/adblockfilters/main/rules/adblockfilters.txt
curl -o i-4.txt https://raw.iqiq.io/ilxp/koolproxy/master/rules/koolproxy.txt
curl -o i-4.txt https://raw.iqiq.io/ilxp/koolproxy/master/rules/daily.txt
curl -o i-4.txt https://raw.iqiq.io/ilxp/koolproxy/master/rules/adgk.txt
curl -o i-4.txt https://raw.iqiq.io/ilxp/koolproxy/master/rules/steven.txt
curl -o i-4.txt https://ublockorigin.pages.dev/filters/badware.txt
curl -o i-4.txt https://gitcdn.link/cdn/uBlockOrigin/uAssetsCDN/main/filters/privacy.txt
curl -o i-4.txt https://ublockorigin.github.io/uAssets/filters/quick-fixes.txt
curl -o i-4.txt https://cdn.statically.io/gh/uBlockOrigin/uAssetsCDN/main/filters/resource-abuse.txt
curl -o i-4.txt https://gitcdn.link/cdn/uBlockOrigin/uAssetsCDN/main/filters/unbreak.txt
curl -o i-4.txt https://pgl.yoyo.org/adservers/serverlist.php?hostformat=adblockplus&showintro=1&mimetype=plaintext
curl -o i-4.txt https://github.com/Potterli20/file/releases/download/ad-youtube-hosts/ad-youtube-adguardhome.txt
curl -o i-4.txt https://filters.adtidy.org/extension/ublock/filters/11.txt
curl -o i-4.txt https://github.com/Potterli20/file/releases/download/ad-hosts-pro/ad-adguardhome-dnstype.txt

# 合并规则并去除重复项
cat i*.txt > i-mergd.txt
cat i-mergd.txt | grep -v '^!' | grep -v '^！' | grep -v '^# ' | grep -v '^# ' | grep -v '^\[' | grep -v '^\【' > i-tmpp.txt
sort -n i-tmpp.txt | uniq > i-tmp.txt

python rule.py i-tmp.txt

# 计算规则数
num=`cat i-tmp.txt | wc -l`

# 添加标题和时间
echo "[Adblock Plus 2.0]" >> i-tpdate.txt
echo "! Title: ABP Merge Rules" >> i-tpdate.txt
echo "! Description: 该规则合并自jiekouAD，AdGuard中文语言规则，easylistnocssrule，乘风视频广告过滤规则、EasylistChina、EasylistLite、CJX'sAnnoyance，以及补充的一些规则" >> i-tpdate.txt
echo "! Homepage: https://github.com/damengzhu/abpmerge" >> i-tpdate.txt
echo "! Version: `date +"%Y-%m-%d %H:%M:%S"`" >> i-tpdate.txt
echo "! Total count: $num" >> i-tpdate.txt
cat i-tpdate.txt i-tmp.txt > abpmerge.txt

cat "abpmerge.txt" | grep \
-e "\(^\|\w\)#@\?#" \
-e "\(^\|\w\)#@\??#" \
-e "\(^\|\w\)#@\?\$#" \
-e "\(^\|\w\)#@\?\$?#" \
> "CSSRule.txt"

# 从 https://filters.adtidy.org/android/filters/2_optimized.txt 下载规则文件
# 移除包含 # 或 generichide 的行，然后生成 easylistnocssrule.txt 的修改版本到当前工作目录。

# 获取规则文件并将其存储在内存中
EASYLIST=$(wget -q -O - https://filters.adtidy.org/android/filters/2_optimized.txt)

# 移除包含 # 或 generichide 的行
echo "$EASYLIST" | grep -v "#" | grep -v "generichide" > easylistnocssrule.txt

# 将 easylistnocssrule.txt 复制到存储库中
cp easylistnocssrule.txt /path/to/repository/


# 删除缓存
rm i-*.txt

#退出程序
exit


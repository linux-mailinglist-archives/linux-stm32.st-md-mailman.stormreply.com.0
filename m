Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF327BDED35
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 15:48:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96423C56622;
	Wed, 15 Oct 2025 13:48:20 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F4073C349C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=MwFUZRcv21TShJjVs4KJh/fT72CUypxlCP4I3MaoS90=; b=N
 VOm0BjqrcUrJ0vBowKY2KGLbLglUxDBQbiQedPBaGsSFHFxdCIMRn7HuBcd9pGfT
 9lfxi/qkyUncMUvaYALbUnh2h4TF0+TWu99jJY0uPD3HYgcoN+GjT38yET/27gB0
 tgqiO/H2yftVE8VBD8rDCeZB/OTKWMqhJj+LQu8nfM=
Received: from sensor1010$163.com ( [112.4.48.30] ) by
 ajax-webmail-wmsvr-40-143 (Coremail) ; Wed, 15 Oct 2025 21:47:27 +0800
 (CST)
X-Originating-IP: [112.4.48.30]
Date: Wed, 15 Oct 2025 21:47:27 +0800 (CST)
From: lizhe  <sensor1010@163.com>
To: "Simon Horman" <horms@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250723(a044bf12) Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <aO9iZiMBs3pUnb77@horms.kernel.org>
References: <20251015040847.6421-1-sensor1010@163.com>
 <aO9iZiMBs3pUnb77@horms.kernel.org>
X-NTES-SC: AL_Qu2dAvmYuUgv4SOeZekfmUYWh+s5XcSzv/gk2YVSNpF8jC/ryi0lQUF9BH/5zsyGID+NmiWHQChE6Mp8TZJaUasKZp0awGc+FQbzR4ItSv1now==
MIME-Version: 1.0
Message-ID: <354d1e75.a49a.199e8202f0a.Coremail.sensor1010@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jygvCgC370nvpe9os_gLAA--.1685W
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBMQ3nq2jvUUduLQAFsn
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Cc: linux-kernel@vger.kernel.org, jonas@kwiboo.se, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, chaoyi.chen@rock-chips.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 david.wu@rock-chips.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: dwmac-rk: No need to check
 the return value of the phy_power_on()
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9102005829243429633=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============9102005829243429633==
Content-Type: multipart/alternative; 
	boundary="----=_Part_161002_182946502.1760536047370"

------=_Part_161002_182946502.1760536047370
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGksIAoKCnRoeCwgCgoKaSB3aWxsIG1vZGlmeSB0aGlzIHBhdGNoLgoKCgoKCgoKQXQgMjAyNS0x
MC0xNSAxNjo1OToxOCwgIlNpbW9uIEhvcm1hbiIgPGhvcm1zQGtlcm5lbC5vcmc+IHdyb3RlOgo+
T24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMDk6MDg6NDdQTSAtMDcwMCwgTGl6aGUgd3JvdGU6Cj4+
ICdwaHlfcG93ZXJfb24nIGlzIGEgbG9jYWwgc2NvcGUgb25lIHdpdGhpbiB0aGUgZHJpdmVyLCBz
aW5jZSB0aGUgcmV0dXJuCj4+IHZhbHVlIG9mIHRoZSBwaHlfcG93ZXJfb24oKSBmdW5jdGlvbiBp
cyBhbHdheXMgMCwgY2hlY2tpbmcgaXRzIHJldHVybgo+PiB2YWx1ZSBpcyByZWR1bmRhbnQuCj4+
IAo+PiB0aGUgZnVuY3Rpb24gbmFtZSAncGh5X3Bvd2VyX29uKCknIGNvbmZsaWN0cyB3aXRoIHRo
ZSBleGlzdGluZwo+PiBwaHlfcG93ZXJfb24oKSBmdW5jdGlvbiBpbiB0aGUgUEhZIHN1YnN5c3Rl
bS4gYSBzdWl0YWJsZSBhbHRlcm5hdGl2ZQo+PiBuYW1lIHdvdWxkIGJlIHJrX3BoeV9wb3dlcl9z
ZXQoKSwgcGFydGljdWxhcmx5IHNpbmNlIHdoZW4gdGhlIHNlY29uZAo+PiBhcmd1bWVudCBpcyBm
YWxzZSwgdGhpcyBmdW5jdGlvbiBhY3R1YWxseSBwb3dlcnMgb2ZmIHRoZSBQSFkKPj4gCj4+IFNp
Z25lZC1vZmYtYnk6IExpemhlIDxzZW5zb3IxMDEwQDE2My5jb20+Cj4+IC0tLQo+PiAgZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYyB8IDE3ICsrKystLS0tLS0t
LS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMo
LSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYy1yay5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
cmsuYwo+PiBpbmRleCA1MWVhMGNhZjE2YzEuLjlkMjk2YmZhYjAxMyAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+PiArKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4+IEBAIC0xNDYx
LDIzICsxNDYxLDE4IEBAIHN0YXRpYyBpbnQgZ21hY19jbGtfZW5hYmxlKHN0cnVjdCBya19wcml2
X2RhdGEgKmJzcF9wcml2LCBib29sIGVuYWJsZSkKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gIAo+
PiAtc3RhdGljIGludCBwaHlfcG93ZXJfb24oc3RydWN0IHJrX3ByaXZfZGF0YSAqYnNwX3ByaXYs
IGJvb2wgZW5hYmxlKQo+PiArc3RhdGljIHZvaWQgcmtfcGh5X3Bvd2VyX29uKHN0cnVjdCBya19w
cml2X2RhdGEgKmJzcF9wcml2LCBib29sIGVuYWJsZSkKPgo+SGkgTGl6aGUsCj4KPlRoaXMgaW50
cm9kdWNlcyBhIGNvbXBpbGF0aW9uIGVycm9yIGJlY2F1c2UgcGh5X3Bvd2VyX29uKCkKPmlzIHN0
aWxsIHVzZWQgb24gbGluZSAxNjcwLgo+Cj5QZXJoYXBzIHRoZSBodW5rIHRvIHVwZGF0ZSB0aGF0
IGxpbmUgZ290IGxvc3Qgc29tZXdoZXJlLgo+Cj4tLSAKPnB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0
ZWQKPgo+Li4uCg==
------=_Part_161002_182946502.1760536047370
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRpdiBp
ZD0ic3BuRWRpdG9yQ29udGVudCI+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+SGksJm5ic3A7PC9k
aXY+PGRpdiBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjog
MDsiPnRoeCwmbmJzcDs8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9kaXY+PGRp
diBzdHlsZT0ibWFyZ2luOiAwOyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMTcsIDE3LCA1MSk7
IGZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLCBibGlua21hY3N5c3RlbWZvbnQsICZxdW90O0hl
bHZldGljYSBOZXVlJnF1b3Q7LCBoZWx2ZXRpY2EsICZxdW90O3NlZ29lIHVpJnF1b3Q7LCBhcmlh
bCwgcm9ib3RvLCAmcXVvdDtQaW5nRmFuZyBTQyZxdW90OywgbWl1aSwgJnF1b3Q7SGlyYWdpbm8g
U2FucyBHQiZxdW90OywgJnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LCBzYW5zLXNlcmlmLCAm
cXVvdDtTb3VyY2UgSGFuIFNlcmlmJnF1b3Q7OyBmb250LXNpemU6IDE2cHg7IGxldHRlci1zcGFj
aW5nOiAwLjA2NHB4OyB3aGl0ZS1zcGFjZS1jb2xsYXBzZTogcHJlc2VydmU7Ij5pIHdpbGwgbW9k
aWZ5IHRoaXMgcGF0Y2guPC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48
L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9kaXY+PC9kaXY+PGRpdiBzdHlsZT0i
cG9zaXRpb246cmVsYXRpdmU7em9vbToxIj48L2Rpdj48ZGl2IGlkPSJkaXZOZXRlYXNlTWFpbENh
cmQiPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L2Rpdj48cHJlPjxicj5BdCAy
MDI1LTEwLTE1IDE2OjU5OjE4LCAiU2ltb24gSG9ybWFuIiAmbHQ7aG9ybXNAa2VybmVsLm9yZyZn
dDsgd3JvdGU6CiZndDtPbiBUdWUsIE9jdCAxNCwgMjAyNSBhdCAwOTowODo0N1BNIC0wNzAwLCBM
aXpoZSB3cm90ZToKJmd0OyZndDsgJ3BoeV9wb3dlcl9vbicgaXMgYSBsb2NhbCBzY29wZSBvbmUg
d2l0aGluIHRoZSBkcml2ZXIsIHNpbmNlIHRoZSByZXR1cm4KJmd0OyZndDsgdmFsdWUgb2YgdGhl
IHBoeV9wb3dlcl9vbigpIGZ1bmN0aW9uIGlzIGFsd2F5cyAwLCBjaGVja2luZyBpdHMgcmV0dXJu
CiZndDsmZ3Q7IHZhbHVlIGlzIHJlZHVuZGFudC4KJmd0OyZndDsgCiZndDsmZ3Q7IHRoZSBmdW5j
dGlvbiBuYW1lICdwaHlfcG93ZXJfb24oKScgY29uZmxpY3RzIHdpdGggdGhlIGV4aXN0aW5nCiZn
dDsmZ3Q7IHBoeV9wb3dlcl9vbigpIGZ1bmN0aW9uIGluIHRoZSBQSFkgc3Vic3lzdGVtLiBhIHN1
aXRhYmxlIGFsdGVybmF0aXZlCiZndDsmZ3Q7IG5hbWUgd291bGQgYmUgcmtfcGh5X3Bvd2VyX3Nl
dCgpLCBwYXJ0aWN1bGFybHkgc2luY2Ugd2hlbiB0aGUgc2Vjb25kCiZndDsmZ3Q7IGFyZ3VtZW50
IGlzIGZhbHNlLCB0aGlzIGZ1bmN0aW9uIGFjdHVhbGx5IHBvd2VycyBvZmYgdGhlIFBIWQomZ3Q7
Jmd0OyAKJmd0OyZndDsgU2lnbmVkLW9mZi1ieTogTGl6aGUgJmx0O3NlbnNvcjEwMTBAMTYzLmNv
bSZndDsKJmd0OyZndDsgLS0tCiZndDsmZ3Q7ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1yay5jIHwgMTcgKysrKy0tLS0tLS0tLS0tLS0KJmd0OyZndDsgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQomZ3Q7Jmd0OyAKJmd0
OyZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLXJrLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5j
CiZndDsmZ3Q7IGluZGV4IDUxZWEwY2FmMTZjMS4uOWQyOTZiZmFiMDEzIDEwMDY0NAomZ3Q7Jmd0
OyAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCiZn
dDsmZ3Q7ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJr
LmMKJmd0OyZndDsgQEAgLTE0NjEsMjMgKzE0NjEsMTggQEAgc3RhdGljIGludCBnbWFjX2Nsa19l
bmFibGUoc3RydWN0IHJrX3ByaXZfZGF0YSAqYnNwX3ByaXYsIGJvb2wgZW5hYmxlKQomZ3Q7Jmd0
OyAgCXJldHVybiAwOwomZ3Q7Jmd0OyAgfQomZ3Q7Jmd0OyAgCiZndDsmZ3Q7IC1zdGF0aWMgaW50
IHBoeV9wb3dlcl9vbihzdHJ1Y3QgcmtfcHJpdl9kYXRhICpic3BfcHJpdiwgYm9vbCBlbmFibGUp
CiZndDsmZ3Q7ICtzdGF0aWMgdm9pZCBya19waHlfcG93ZXJfb24oc3RydWN0IHJrX3ByaXZfZGF0
YSAqYnNwX3ByaXYsIGJvb2wgZW5hYmxlKQomZ3Q7CiZndDtIaSBMaXpoZSwKJmd0OwomZ3Q7VGhp
cyBpbnRyb2R1Y2VzIGEgY29tcGlsYXRpb24gZXJyb3IgYmVjYXVzZSBwaHlfcG93ZXJfb24oKQom
Z3Q7aXMgc3RpbGwgdXNlZCBvbiBsaW5lIDE2NzAuCiZndDsKJmd0O1BlcmhhcHMgdGhlIGh1bmsg
dG8gdXBkYXRlIHRoYXQgbGluZSBnb3QgbG9zdCBzb21ld2hlcmUuCiZndDsKJmd0Oy0tIAomZ3Q7
cHctYm90OiBjaGFuZ2VzLXJlcXVlc3RlZAomZ3Q7CiZndDsuLi4KPC9wcmU+PC9kaXY+
------=_Part_161002_182946502.1760536047370--


--===============9102005829243429633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============9102005829243429633==--


Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4ADAC2FF3
	for <lists+linux-stm32@lfdr.de>; Sat, 24 May 2025 16:06:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0097C78F7F;
	Sat, 24 May 2025 14:06:55 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3D48C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 May 2025 14:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=1WN2euXBWkhIS8al3TR0Lw9Ez6nmcqLOpNr78XYkzPs=; b=B
 FdEKi8KfXkMlKzNGKHQ2A7LGuzcj8J5GJ3rCcrCtOlhtIsH/9e9gOgIQ/srOEK4E
 A9TBw+AVb2dqkup+1rI7/ietftqySi1n+ggF/fB8BC3TU3DtgmDNjWEuwoRdiWHQ
 K610D1v68HkGAlDtMVLhEAAP2dlFL5FEh3pp3PLlG4=
Received: from sensor1010$163.com ( [112.20.94.209] ) by
 ajax-webmail-wmsvr-40-141 (Coremail) ; Sat, 24 May 2025 22:05:47 +0800
 (CST)
X-Originating-IP: [112.20.94.209]
Date: Sat, 24 May 2025 22:05:47 +0800 (CST)
From: lizhe  <sensor1010@163.com>
To: "Andrew Lunn" <andrew@lunn.ch>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <d5325aba-507e-47b6-83fb-b9156c1f351e@lunn.ch>
References: <20250523151521.3503-1-sensor1010@163.com>
 <d5325aba-507e-47b6-83fb-b9156c1f351e@lunn.ch>
X-CM-CTRLMSGS: pB89sHRyYWNlS2V5PXByZV85MWVhYjNiODUwODQyNzhlM2U2M2I5ZDc0ZmQxN
 zFiNQ==
X-NTES-SC: AL_Qu2fCvySuk0v4SGbZukfmkkTgOc6Ucq4vv8n34FSO5lwjCrr+iMkU3tMAXzM8fOOJgWBrheYYiFpx/1ofLB8W74ZNT/Obc2pUwlj0+dsVfbLlQ==
MIME-Version: 1.0
Message-ID: <2525c791.3415.197029d3705.Coremail.sensor1010@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jSgvCgDXn3M70jFoXlgMAA--.38984W
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/xtbBMQNWq2gwmaqGtwACsX
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Cc: linux-kernel@vger.kernel.org, jonas@kwiboo.se, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, wens@csie.org, andrew+netdev@lunn.ch,
 edumazet@google.com, an.petrous@oss.nxp.com, u.kleine-koenig@baylibre.com,
 mcoquelin.stm32@gmail.com, david.wu@rock-chips.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: dwmac-rk: MAC clock should be truned
	off
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
Content-Type: multipart/mixed; boundary="===============6517914600584033586=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============6517914600584033586==
Content-Type: multipart/alternative; 
	boundary="----=_Part_53452_1718519461.1748095547141"

------=_Part_53452_1718519461.1748095547141
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGmjrCBBbmVyZHcKVGhlIGZvbGxvd2luZyBpcyB0aGUgbG9naWMgZm9yIGNhbGxpbmcgdGhpcyBm
dW5jdGlvbqO6IAoKCgoKcmtfZ21hY19wb3dlcnVwKCkgewoKcmV0ID0gcGh5X3Bvd2VyX29uKGJz
cF9wcml2LCB0cnVlKTsgICAgICAvLyBoZXJlLgoKaWYgKHJldCkgewoKZ21hY19jbGtfZW5hYmxl
KGJzcF9wcml2LCBmYWxzZSk7CgpyZXR1cm4gcmV0OwoKfQoKfQoKSWYgdGhpcyBmdW5jdGlvbiBj
b25zaXN0ZW50bHkgcmV0dXJucyAwLCBpcyB0aGVyZSBzdGlsbCBhIG5lZWQgdG8gdmFsaWRhdGUg
aXRzIHJldHVybiB2YWx1ZT8KVGhlIHJhdGlvbmFsZSBmb3IgY2hlY2tpbmcgdGhlIHJldHVybiB2
YWx1ZSBpcyB0byBkaXNhYmxlIHRoZSBjbG9jayBvbiBtYWMKCgoKCl9UaGFua3MsCkxpemhlCgoK
CgoKCgoKCgoKQXQgMjAyNS0wNS0yNCAwMDoyMDoxMywgIkFuZHJldyBMdW5uIiA8YW5kcmV3QGx1
bm4uY2g+IHdyb3RlOgo+T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMDg6MTU6MjFBTSAtMDcwMCwg
wO7V3CB3cm90ZToKPj4gaWYgUEhZIHBvd2VyLW9uIGZhaWxzLCBjbG9ja2Fzc29jaWF0ZWQgdGhl
IE1BQyBzaG91bGQKPj4gYmUgZGlzYWJsZWQgZHVyaW5nIHRoZSBNQUMgaW5pdGlhbGl6YXRpb24g
cHJvY2Vzcwo+Cj5UaGUgU3ViamVjdDogbGluZSBoYXMgYSB0eXBvLgo+Cj4+IFNpZ25lZC1vZmYt
Ynk6IMDu1dwgPHNlbnNvcjEwMTBAMTYzLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jIHwgNCArKy0tCj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCj4+IGluZGV4IDcwMDg1OGZmNmY3
Yy4uMDM2ZTQ1YmU1ODI4IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1yay5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWlj
cm8vc3RtbWFjL2R3bWFjLXJrLmMKPj4gQEAgLTE2NDgsNyArMTY0OCw3IEBAIHN0YXRpYyBpbnQg
Z21hY19jbGtfZW5hYmxlKHN0cnVjdCBya19wcml2X2RhdGEgKmJzcF9wcml2LCBib29sIGVuYWJs
ZSkKPj4gIHN0YXRpYyBpbnQgcGh5X3Bvd2VyX29uKHN0cnVjdCBya19wcml2X2RhdGEgKmJzcF9w
cml2LCBib29sIGVuYWJsZSkKPj4gIHsKPj4gIAlzdHJ1Y3QgcmVndWxhdG9yICpsZG8gPSBic3Bf
cHJpdi0+cmVndWxhdG9yOwo+PiAtCWludCByZXQ7Cj4+ICsJaW50IHJldCA9IDA7Cj4+ICAJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJmJzcF9wcml2LT5wZGV2LT5kZXY7Cj4+ICAKPj4gIAlpZiAoZW5h
YmxlKSB7Cj4+IEBAIC0xNjYxLDcgKzE2NjEsNyBAQCBzdGF0aWMgaW50IHBoeV9wb3dlcl9vbihz
dHJ1Y3QgcmtfcHJpdl9kYXRhICpic3BfcHJpdiwgYm9vbCBlbmFibGUpCj4+ICAJCQlkZXZfZXJy
KGRldiwgImZhaWwgdG8gZGlzYWJsZSBwaHktc3VwcGx5XG4iKTsKPj4gIAl9Cj4+ICAKPj4gLQly
ZXR1cm4gMDsKPj4gKwlyZXR1cm4gcmV0Owo+Cj5UaGlzIGRvZXMgbm90IG1ha2UgbXVjaCBzZW5z
ZSB0byBtZS4gSG93IGRvIHlvdSBnZXQgaGVyZSB3aXRoIHJldCBub3QKPmJlaW5nIDA/Cj4KPiAg
ICBBbmRyZXcKPgo+LS0tCj5wdy1ib3Q6IGNyCg==
------=_Part_53452_1718519461.1748095547141
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRpdiBp
ZD0ic3BuRWRpdG9yQ29udGVudCI+PHAgc3R5bGU9Im1hcmdpbjogMDsiPkhpo6wgQW5lcmR3PGJy
PlRoZSBmb2xsb3dpbmcgaXMgdGhlIGxvZ2ljIGZvciBjYWxsaW5nIHRoaXMgZnVuY3Rpb26juiZu
YnNwOzwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cCBzdHlsZT0ibWFyZ2luOiAw
OyI+cmtfZ21hY19wb3dlcnVwKCkgezwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PHNwYW4gc3R5
bGU9IndoaXRlLXNwYWNlOiBub3JtYWw7Ij48c3BhbiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4J
PC9zcGFuPnJldCA9IHBoeV9wb3dlcl9vbihic3BfcHJpdiwgdHJ1ZSk7Jm5ic3A7ICZuYnNwOyAm
bmJzcDsgLy8gaGVyZS48L3NwYW4+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48c3BhbiBzdHls
ZT0id2hpdGUtc3BhY2U6IG5vcm1hbDsiPjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgk8
L3NwYW4+aWYgKHJldCkgezwvc3Bhbj48L3A+PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxzcGFuIHN0
eWxlPSJ3aGl0ZS1zcGFjZTogbm9ybWFsOyI+PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+
CQk8L3NwYW4+Z21hY19jbGtfZW5hYmxlKGJzcF9wcml2LCBmYWxzZSk7PC9zcGFuPjwvcD48cCBz
dHlsZT0ibWFyZ2luOiAwOyI+PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOiBub3JtYWw7Ij48c3Bh
biBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JCTwvc3Bhbj5yZXR1cm4gcmV0Ozwvc3Bhbj48L3A+
PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxzcGFuIHN0eWxlPSJ3aGl0ZS1zcGFjZTogbm9ybWFsOyI+
PHNwYW4gc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwvc3Bhbj59PC9zcGFuPjwvcD48cCBzdHls
ZT0ibWFyZ2luOiAwOyI+fTxicj48YnI+SWYgdGhpcyBmdW5jdGlvbiBjb25zaXN0ZW50bHkgcmV0
dXJucyAwLCBpcyB0aGVyZSBzdGlsbCBhIG5lZWQgdG8gdmFsaWRhdGUgaXRzIHJldHVybiB2YWx1
ZT8gPGJyPlRoZSByYXRpb25hbGUgZm9yIGNoZWNraW5nIHRoZSByZXR1cm4gdmFsdWUgaXMgdG8g
ZGlzYWJsZSB0aGUgY2xvY2sgb24gbWFjPGJyPjxicj48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46
IDA7Ij5fVGhhbmtzLDxicj5MaXpoZTwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48
cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48L2Rpdj48ZGl2IHN0eWxlPSJwb3NpdGlvbjpy
ZWxhdGl2ZTt6b29tOjEiPjwvZGl2PjxkaXYgaWQ9ImRpdk5ldGVhc2VNYWlsQ2FyZCI+PC9kaXY+
PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L3A+PHByZT48YnI+QXQgMjAyNS0wNS0yNCAwMDoy
MDoxMywgIkFuZHJldyBMdW5uIiAmbHQ7YW5kcmV3QGx1bm4uY2gmZ3Q7IHdyb3RlOgomZ3Q7T24g
RnJpLCBNYXkgMjMsIDIwMjUgYXQgMDg6MTU6MjFBTSAtMDcwMCwgwO7V3CB3cm90ZToKJmd0OyZn
dDsgaWYgUEhZIHBvd2VyLW9uIGZhaWxzLCBjbG9ja2Fzc29jaWF0ZWQgdGhlIE1BQyBzaG91bGQK
Jmd0OyZndDsgYmUgZGlzYWJsZWQgZHVyaW5nIHRoZSBNQUMgaW5pdGlhbGl6YXRpb24gcHJvY2Vz
cwomZ3Q7CiZndDtUaGUgU3ViamVjdDogbGluZSBoYXMgYSB0eXBvLgomZ3Q7CiZndDsmZ3Q7IFNp
Z25lZC1vZmYtYnk6IMDu1dwgJmx0O3NlbnNvcjEwMTBAMTYzLmNvbSZndDsKJmd0OyZndDsgLS0t
CiZndDsmZ3Q7ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5j
IHwgNCArKy0tCiZndDsmZ3Q7ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQomZ3Q7Jmd0OyAKJmd0OyZndDsgZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1yay5jCiZndDsmZ3Q7IGluZGV4IDcwMDg1OGZmNmY3Yy4uMDM2
ZTQ1YmU1ODI4IDEwMDY0NAomZ3Q7Jmd0OyAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1p
Y3JvL3N0bW1hYy9kd21hYy1yay5jCiZndDsmZ3Q7ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0
L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKJmd0OyZndDsgQEAgLTE2NDgsNyArMTY0OCw3IEBA
IHN0YXRpYyBpbnQgZ21hY19jbGtfZW5hYmxlKHN0cnVjdCBya19wcml2X2RhdGEgKmJzcF9wcml2
LCBib29sIGVuYWJsZSkKJmd0OyZndDsgIHN0YXRpYyBpbnQgcGh5X3Bvd2VyX29uKHN0cnVjdCBy
a19wcml2X2RhdGEgKmJzcF9wcml2LCBib29sIGVuYWJsZSkKJmd0OyZndDsgIHsKJmd0OyZndDsg
IAlzdHJ1Y3QgcmVndWxhdG9yICpsZG8gPSBic3BfcHJpdi0mZ3Q7cmVndWxhdG9yOwomZ3Q7Jmd0
OyAtCWludCByZXQ7CiZndDsmZ3Q7ICsJaW50IHJldCA9IDA7CiZndDsmZ3Q7ICAJc3RydWN0IGRl
dmljZSAqZGV2ID0gJmFtcDtic3BfcHJpdi0mZ3Q7cGRldi0mZ3Q7ZGV2OwomZ3Q7Jmd0OyAgCiZn
dDsmZ3Q7ICAJaWYgKGVuYWJsZSkgewomZ3Q7Jmd0OyBAQCAtMTY2MSw3ICsxNjYxLDcgQEAgc3Rh
dGljIGludCBwaHlfcG93ZXJfb24oc3RydWN0IHJrX3ByaXZfZGF0YSAqYnNwX3ByaXYsIGJvb2wg
ZW5hYmxlKQomZ3Q7Jmd0OyAgCQkJZGV2X2VycihkZXYsICJmYWlsIHRvIGRpc2FibGUgcGh5LXN1
cHBseVxuIik7CiZndDsmZ3Q7ICAJfQomZ3Q7Jmd0OyAgCiZndDsmZ3Q7IC0JcmV0dXJuIDA7CiZn
dDsmZ3Q7ICsJcmV0dXJuIHJldDsKJmd0OwomZ3Q7VGhpcyBkb2VzIG5vdCBtYWtlIG11Y2ggc2Vu
c2UgdG8gbWUuIEhvdyBkbyB5b3UgZ2V0IGhlcmUgd2l0aCByZXQgbm90CiZndDtiZWluZyAwPwom
Z3Q7CiZndDsgICAgQW5kcmV3CiZndDsKJmd0Oy0tLQomZ3Q7cHctYm90OiBjcgo8L3ByZT48L2Rp
dj48aW1nIHN0eWxlPSJ3aWR0aDoxcHg7aGVpZ2h0OjFweCIgc3JjPSJodHRwczovL2NvdW50Lm1h
aWwuMTYzLmNvbS9iZWFjb24vd2VibWFpbC5naWY/dHlwZT13ZWJtYWlsX21haWx0cmFjZSZhbXA7
Z3VpZD1wcmVfOTFlYWIzYjg1MDg0Mjc4ZTNlNjNiOWQ3NGZkMTcxYjUiPg==
------=_Part_53452_1718519461.1748095547141--


--===============6517914600584033586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============6517914600584033586==--


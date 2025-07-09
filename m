Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB7AFE19B
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 09:49:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D5E0C36B2B;
	Wed,  9 Jul 2025 07:49:35 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0B2EC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=Fr2uTYjem/3fTlULQcF08UUYYQvmOJGfC0cp/mJIMf8=; b=R
 vo/4bemj34b9v+C+focO3L5GrhZyWgqOHLiBeAo1EfR4BSjUE5qT2eRnpo540EBR
 m62XJOxRDSqLA/cDhOx4UvAdtLAlcqqnhSjTCxZBohGYOY9nW9fojbVNRQfNlzn+
 Ygzqc8dPF+8akPNIo1ZuA/v2Q4XW92+NrJaSGvoszE=
Received: from sensor1010$163.com ( [61.155.242.146] ) by
 ajax-webmail-wmsvr-40-107 (Coremail) ; Wed, 9 Jul 2025 15:48:25 +0800 (CST)
X-Originating-IP: [61.155.242.146]
Date: Wed, 9 Jul 2025 15:48:25 +0800 (CST)
From: lizhe  <sensor1010@163.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
 <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
X-CM-CTRLMSGS: E5M20XRyYWNlS2V5PXByZV9iMmI5MzI2ZjkyMzdiZDY4ZmE4YjI5NjI5ZTJiN
 WMxNA==
X-NTES-SC: AL_Qu2eAPyfuEsr4yiYZekfmU4WhO47Ucewvfwu1IBUNpx6jCHpxAwReHNTIGvo4sWDKhGenQiHViNt5913bZR8QakpYO2rhBC2R+/o9BmmREQAUQ==
MIME-Version: 1.0
Message-ID: <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aygvCgDX_27JHm5oJ_UFAA--.28124W
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiKBOFq2ht5tHPBwACst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 vladimir.oltean@nxp.com, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Support gpio high-level
 reset for devices requiring it
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
Content-Type: multipart/mixed; boundary="===============3744208722166843377=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============3744208722166843377==
Content-Type: multipart/alternative; 
	boundary="----=_Part_102477_70438275.1752047305804"

------=_Part_102477_70438275.1752047305804
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGksIAoKYWZ0ZXIgcmVwbGFjaW5nIHdpdGggdGhpcyBmdW5jdGlvbiwgdGhlIGZ1bmN0aW9uIHJl
dHVybnMgMCwgbWVhbmluZyB0aGUgZ3BpbyBpcwoKc3RpbGwgYXQgYSBsb3cgdm9sdGFnZSBsZXZl
bC4KCisgICAgICAgICAgICAgIGludCBncGlvX3N0YXRlID0gLTE7CgoKCgogICAgICAgICAgICAg
ICAgaWYgKGRlbGF5c1syXSkKCiAgICAgICAgICAgICAgICAgICAgICAgIG1zbGVlcChESVZfUk9V
TkRfVVAoZGVsYXlzWzJdLCAxMDAwKSk7CgorCgorICAgICAgICAgICAgICAgZ3Bpb19zdGF0ZSA9
IGdwaW9kX2dldF9yYXdfdmFsdWVfY2Fuc2xlZXAocmVzZXRfZ3Bpbyk7CgorICAgICAgICAgICAg
ICAgcHJfaW5mbygiZ3Bpb19zdGF0ZTogJWRcbiIsIGdwaW9fc3RhdGUpOwoKKyAgICAgICAgICAg
ICAgIHByX2luZm8oImdwaW9fc3RhdGU6ICVkXG4iLCBncGlvX3N0YXRlKTsKCgoKCgoKCiBncGlv
LTExMSAoICAgICAgICAgICAgICAgICAgICB8c25wcyxyZXNldCAgICAgICAgICApIG91dCBsbwoK
CgoKWyAgICAzLjg5OTMxOV0gZ3Bpb19zdGF0ZTogMAoKWyAgICAzLjg5OTMyNF0gZ3Bpb19zdGF0
ZTogMAoKCgoKCgoKVGh4CgpMaXpoZQoKCkF0IDIwMjUtMDctMDkgMTI6MjY6NTUsICJSdXNzZWxs
IEtpbmcgKE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+T24gV2VkLCBK
dWwgMDksIDIwMjUgYXQgMDk6NTc6NTBBTSArMDgwMCwgbGl6aGUgd3JvdGU6Cj4+ICsgZ3Bpb19z
dGF0ZSA9IGdwaW9kX2dldF92YWx1ZV9jYW5fc2xlZXAocmVzZXRfZ3Bpbyk7Cj4KPlVzZSBncGlv
ZF9nZXRfcmF3X3ZhbHVlX2NhbnNsZWVwKCkuIFRoZSBub3JtYWwgZ2V0L3NldCByZXR1cm4gdGhl
Cj5hY3RpdmUvaW5hY3RpdmUgc3RhdGUsIHdoZXJlYXMgdGhlIF9yYXcgZ2V0L3NldCByZXR1cm4g
dGhlIHBoeXNpY2FsCj5zdGF0ZS4KPgo+LS0gCj5STUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8v
d3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KPkZUVFAgaXMgaGVyZSEgODBN
YnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3QhCg==
------=_Part_102477_70438275.1752047305804
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRpdiBp
ZD0ic3BuRWRpdG9yQ29udGVudCI+PHAgc3R5bGU9Im1hcmdpbjogMDsiPkhpLCZuYnNwOzwvcD48
cCBzdHlsZT0ibWFyZ2luOiAwOyI+YWZ0ZXIgcmVwbGFjaW5nIHdpdGggdGhpcyBmdW5jdGlvbiwg
dGhlIGZ1bmN0aW9uIHJldHVybnMgMCwgbWVhbmluZyB0aGUgZ3BpbyBpczwvcD48cCBzdHlsZT0i
bWFyZ2luOiAwOyI+c3RpbGwgYXQgYSBsb3cgdm9sdGFnZSBsZXZlbC48YnI+PGJyPismbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgaW50IGdwaW9fc3RhdGUg
PSAtMTs8L3A+PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L3A+PHAgc3R5bGU9Im1hcmdpbjog
MDsiPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgaWYgKGRlbGF5c1syXSk8L3A+PHAgc3R5bGU9Im1hcmdpbjogMDsiPiZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7IG1zbGVlcChESVZfUk9VTkRfVVAoZGVsYXlzWzJdLCAxMDAwKSk7PC9wPjxw
IHN0eWxlPSJtYXJnaW46IDA7Ij4rPC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij4rJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2dwaW9fc3RhdGUg
PSBncGlvZF9nZXRfcmF3X3ZhbHVlX2NhbnNsZWVwKHJlc2V0X2dwaW8pOzwvcD48cCBzdHlsZT0i
bWFyZ2luOiAwOyI+KyZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDtwcl9pbmZvKCJncGlvX3N0YXRlOiAlZFxuIiwgZ3Bpb19zdGF0ZSk7PC9wPjxw
IHN0eWxlPSJtYXJnaW46IDA7Ij4rJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwO3ByX2luZm8oImdwaW9fc3RhdGU6ICVkXG4iLCBncGlvX3N0YXRl
KTs8L3A+PGRpdj48YnI+PC9kaXY+PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L3A+PHAgc3R5
bGU9Im1hcmdpbjogMDsiPiZuYnNwO2dwaW8tMTExICgmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgfHNucHMscmVzZXQm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICkgb3V0IGxvPC9wPjxwIHN0eWxlPSJt
YXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij5bJm5ic3A7ICZuYnNwOyAz
Ljg5OTMxOV0gZ3Bpb19zdGF0ZTogMDwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+WyZuYnNwOyAm
bmJzcDsgMy44OTkzMjRdIGdwaW9fc3RhdGU6IDA8L3A+PGRpdj48YnI+PC9kaXY+PHAgc3R5bGU9
Im1hcmdpbjogMDsiPjxicj48L3A+PHAgc3R5bGU9Im1hcmdpbjogMDsiPlRoeDwvcD48L2Rpdj48
ZGl2IHN0eWxlPSJwb3NpdGlvbjpyZWxhdGl2ZTt6b29tOjEiPjwvZGl2PjxkaXYgaWQ9ImRpdk5l
dGVhc2VNYWlsQ2FyZCI+PC9kaXY+PHAgc3R5bGU9Im1hcmdpbjogMDsiPkxpemhlPC9wPjxwcmU+
PGJyPkF0IDIwMjUtMDctMDkgMTI6MjY6NTUsICJSdXNzZWxsIEtpbmcgKE9yYWNsZSkiICZsdDts
aW51eEBhcm1saW51eC5vcmcudWsmZ3Q7IHdyb3RlOgomZ3Q7T24gV2VkLCBKdWwgMDksIDIwMjUg
YXQgMDk6NTc6NTBBTSArMDgwMCwgbGl6aGUgd3JvdGU6CiZndDsmZ3Q7ICsgZ3Bpb19zdGF0ZSA9
IGdwaW9kX2dldF92YWx1ZV9jYW5fc2xlZXAocmVzZXRfZ3Bpbyk7CiZndDsKJmd0O1VzZSBncGlv
ZF9nZXRfcmF3X3ZhbHVlX2NhbnNsZWVwKCkuIFRoZSBub3JtYWwgZ2V0L3NldCByZXR1cm4gdGhl
CiZndDthY3RpdmUvaW5hY3RpdmUgc3RhdGUsIHdoZXJlYXMgdGhlIF9yYXcgZ2V0L3NldCByZXR1
cm4gdGhlIHBoeXNpY2FsCiZndDtzdGF0ZS4KJmd0OwomZ3Q7LS0gCiZndDtSTUsncyBQYXRjaCBz
eXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KJmd0
O0ZUVFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5
IGF0IGxhc3QhCjwvcHJlPjwvZGl2PjxpbWcgc3R5bGU9IndpZHRoOjFweDtoZWlnaHQ6MXB4IiBz
cmM9Imh0dHBzOi8vY291bnQubWFpbC4xNjMuY29tL2JlYWNvbi93ZWJtYWlsLmdpZj90eXBlPXdl
Ym1haWxfbWFpbHRyYWNlJmFtcDtndWlkPXByZV9iMmI5MzI2ZjkyMzdiZDY4ZmE4YjI5NjI5ZTJi
NWMxNCI+
------=_Part_102477_70438275.1752047305804--


--===============3744208722166843377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============3744208722166843377==--


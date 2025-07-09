Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6628FAFE800
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 13:44:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 131ACC36B19;
	Wed,  9 Jul 2025 11:44:04 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4F1BC36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 11:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=2WY2jgStOZkXqhCuhXlyisr06+6XilvyAulSo2jc6DI=; b=k
 PgmchPrcFFYdJjUVOON3ZajGf51MzTlQ40/nGatvdpLTctNH17yFClp0hcHExnAH
 W2BREE0KMUI9VE4hlegXAfSTs5CJ2FMpSK8Kn4FjXWM4ylPj6S0eEp7xPxh4nRQP
 BSJrI13Saf60Px3+SnLixJ33B3gszsG8NQVM1f9498=
Received: from sensor1010$163.com ( [61.155.242.146] ) by
 ajax-webmail-wmsvr-40-126 (Coremail) ; Wed, 9 Jul 2025 19:42:55 +0800 (CST)
X-Originating-IP: [61.155.242.146]
Date: Wed, 9 Jul 2025 19:42:55 +0800 (CST)
From: lizhe  <sensor1010@163.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <aG5ORmbgMYd08eNR@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
 <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
 <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
 <aG5ORmbgMYd08eNR@shell.armlinux.org.uk>
X-CM-CTRLMSGS: ZPCV6XRyYWNlS2V5PXByZV9mYWE5NjczY2ZmZTg2YmI0NzIzNmZjMGU3NDQ2M
 TM0ZQ==
X-NTES-MT-INF: pre_faa9673cffe86bb47236fc0e7446134e
X-NTES-SC: AL_Qu2eAPydvkss4yibZekfmU4WhO47Ucewvfwu1IBUNpx6jA3pwg8ObWVSEVvS3Ma0CwSomgmGUwVO7N1ZT61gTroBx21SqVzsnXpg0CpwA1H0pQ==
MIME-Version: 1.0
Message-ID: <4cfb4aab.9588.197eefef55f.Coremail.sensor1010@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: figvCgDnj0bAVW5oLQEAAA--.105W
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiKAmFq2huHgF6CgADsl
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
Content-Type: multipart/mixed; boundary="===============1316725731702827091=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1316725731702827091==
Content-Type: multipart/alternative; 
	boundary="----=_Part_145495_603424855.1752061375838"

------=_Part_145495_603424855.1752061375838
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGksCgogICAgaSBoYXZlIGFscmVhZHkgZGVjbGFyZWQgaXQgaW4gdGhlIERUUy4KCgoKCiAgICAm
Z21hYyB7CgogICAgICAgICAgICBzbnBzLHJlc2V0LWdwaW8gPSA8JmdwaW8zIFJLX1BCNyBHUElP
X0FDVElWRV9ISUdIPjsKCgoKCiAgICB9OwoKCgoKCgoKVGh4ICEKCkxpemhlCgoKCgoKQXQgMjAy
NS0wNy0wOSAxOToxMTowMiwgIlJ1c3NlbGwgS2luZyAoT3JhY2xlKSIgPGxpbnV4QGFybWxpbnV4
Lm9yZy51az4gd3JvdGU6Cj5PbiBXZWQsIEp1bCAwOSwgMjAyNSBhdCAwMzo0ODoyNVBNICswODAw
LCBsaXpoZSB3cm90ZToKPj4gSGksIAo+PiAKPj4gYWZ0ZXIgcmVwbGFjaW5nIHdpdGggdGhpcyBm
dW5jdGlvbiwgdGhlIGZ1bmN0aW9uIHJldHVybnMgMCwgbWVhbmluZyB0aGUgZ3BpbyBpcwo+PiBz
dGlsbCBhdCBhIGxvdyB2b2x0YWdlIGxldmVsLgo+PiAKPj4gKyAgICAgICAgICAgICAgaW50IGdw
aW9fc3RhdGUgPSAtMTsKPj4gCj4+IAo+PiAgICAgICAgICAgICAgICAgaWYgKGRlbGF5c1syXSkK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgbXNsZWVwKERJVl9ST1VORF9VUChkZWxheXNbMl0s
IDEwMDApKTsKPj4gKwo+PiArICAgICAgICAgICAgICAgZ3Bpb19zdGF0ZSA9IGdwaW9kX2dldF9y
YXdfdmFsdWVfY2Fuc2xlZXAocmVzZXRfZ3Bpbyk7Cj4+ICsgICAgICAgICAgICAgICBwcl9pbmZv
KCJncGlvX3N0YXRlOiAlZFxuIiwgZ3Bpb19zdGF0ZSk7Cj4+ICsgICAgICAgICAgICAgICBwcl9p
bmZvKCJncGlvX3N0YXRlOiAlZFxuIiwgZ3Bpb19zdGF0ZSk7Cj4+IAo+PiAgZ3Bpby0xMTEgKCAg
ICAgICAgICAgICAgICAgICAgfHNucHMscmVzZXQgICAgICAgICAgKSBvdXQgbG8KPj4gCj4+IAo+
PiBbICAgIDMuODk5MzE5XSBncGlvX3N0YXRlOiAwCj4+IFsgICAgMy44OTkzMjRdIGdwaW9fc3Rh
dGU6IDAKPgo+SG93IGhhdmUgeW91IGRlY2xhcmVkIHRoZSBzbnBzLHJlc2V0LWdwaW8gcHJvcGVy
dHkgaW4gRFQ/Cj4KPi0tIAo+Uk1LJ3MgUGF0Y2ggc3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51
eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCj5GVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEw
TWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQo=
------=_Part_145495_603424855.1752061375838
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRpdiBp
ZD0ic3BuRWRpdG9yQ29udGVudCI+PHAgc3R5bGU9Im1hcmdpbjogMDsiPkhpLDwvcD48cCBzdHls
ZT0ibWFyZ2luOiAwOyI+Jm5ic3A7ICZuYnNwOyBpIGhhdmUgYWxyZWFkeSBkZWNsYXJlZCBpdCBp
biB0aGUgRFRTLjwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cCBzdHlsZT0ibWFy
Z2luOiAwOyI+Jm5ic3A7ICZuYnNwOyAmYW1wO2dtYWMgezwvcD48cCBzdHlsZT0ibWFyZ2luOiAw
OyI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsmbmJzcDtzbnBzLHJl
c2V0LWdwaW8gPSAmbHQ7JmFtcDtncGlvMyBSS19QQjcgR1BJT19BQ1RJVkVfSElHSCZndDs7PC9w
PjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij4mbmJz
cDsgJm5ic3A7IH07PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJt
YXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij5UaHggITwvcD48cCBzdHls
ZT0ibWFyZ2luOiAwOyI+TGl6aGU8L3A+PC9kaXY+PGRpdiBzdHlsZT0icG9zaXRpb246cmVsYXRp
dmU7em9vbToxIj48L2Rpdj48ZGl2IGlkPSJkaXZOZXRlYXNlTWFpbENhcmQiPjwvZGl2PjxwIHN0
eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwcmU+PGJyPkF0IDIwMjUtMDctMDkgMTk6MTE6MDIs
ICJSdXNzZWxsIEtpbmcgKE9yYWNsZSkiICZsdDtsaW51eEBhcm1saW51eC5vcmcudWsmZ3Q7IHdy
b3RlOgomZ3Q7T24gV2VkLCBKdWwgMDksIDIwMjUgYXQgMDM6NDg6MjVQTSArMDgwMCwgbGl6aGUg
d3JvdGU6CiZndDsmZ3Q7IEhpLCAKJmd0OyZndDsgCiZndDsmZ3Q7IGFmdGVyIHJlcGxhY2luZyB3
aXRoIHRoaXMgZnVuY3Rpb24sIHRoZSBmdW5jdGlvbiByZXR1cm5zIDAsIG1lYW5pbmcgdGhlIGdw
aW8gaXMKJmd0OyZndDsgc3RpbGwgYXQgYSBsb3cgdm9sdGFnZSBsZXZlbC4KJmd0OyZndDsgCiZn
dDsmZ3Q7ICsgICAgICAgICAgICAgIGludCBncGlvX3N0YXRlID0gLTE7CiZndDsmZ3Q7IAomZ3Q7
Jmd0OyAKJmd0OyZndDsgICAgICAgICAgICAgICAgIGlmIChkZWxheXNbMl0pCiZndDsmZ3Q7ICAg
ICAgICAgICAgICAgICAgICAgICAgIG1zbGVlcChESVZfUk9VTkRfVVAoZGVsYXlzWzJdLCAxMDAw
KSk7CiZndDsmZ3Q7ICsKJmd0OyZndDsgKyAgICAgICAgICAgICAgIGdwaW9fc3RhdGUgPSBncGlv
ZF9nZXRfcmF3X3ZhbHVlX2NhbnNsZWVwKHJlc2V0X2dwaW8pOwomZ3Q7Jmd0OyArICAgICAgICAg
ICAgICAgcHJfaW5mbygiZ3Bpb19zdGF0ZTogJWRcbiIsIGdwaW9fc3RhdGUpOwomZ3Q7Jmd0OyAr
ICAgICAgICAgICAgICAgcHJfaW5mbygiZ3Bpb19zdGF0ZTogJWRcbiIsIGdwaW9fc3RhdGUpOwom
Z3Q7Jmd0OyAKJmd0OyZndDsgIGdwaW8tMTExICggICAgICAgICAgICAgICAgICAgIHxzbnBzLHJl
c2V0ICAgICAgICAgICkgb3V0IGxvCiZndDsmZ3Q7IAomZ3Q7Jmd0OyAKJmd0OyZndDsgWyAgICAz
Ljg5OTMxOV0gZ3Bpb19zdGF0ZTogMAomZ3Q7Jmd0OyBbICAgIDMuODk5MzI0XSBncGlvX3N0YXRl
OiAwCiZndDsKJmd0O0hvdyBoYXZlIHlvdSBkZWNsYXJlZCB0aGUgc25wcyxyZXNldC1ncGlvIHBy
b3BlcnR5IGluIERUPwomZ3Q7CiZndDstLSAKJmd0O1JNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6
Ly93d3cuYXJtbGludXgub3JnLnVrL2RldmVsb3Blci9wYXRjaGVzLwomZ3Q7RlRUUCBpcyBoZXJl
ISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKPC9w
cmU+PC9kaXY+PGltZyBzdHlsZT0id2lkdGg6MXB4O2hlaWdodDoxcHgiIHNyYz0iaHR0cHM6Ly9j
b3VudC5tYWlsLjE2My5jb20vYmVhY29uL3dlYm1haWwuZ2lmP3R5cGU9d2VibWFpbF9tYWlsdHJh
Y2UmYW1wO2d1aWQ9cHJlX2ZhYTk2NzNjZmZlODZiYjQ3MjM2ZmMwZTc0NDYxMzRlIj48aW1nIHN0
eWxlPSJ3aWR0aDoxcHg7aGVpZ2h0OjFweCIgc3JjPSJodHRwczovL2hlcm1lcy5tYWlsLjE2My5j
b20vbXQvaWNvbi5naWY/a2V5PXByZV9mYWE5NjczY2ZmZTg2YmI0NzIzNmZjMGU3NDQ2MTM0ZSZh
bXA7LUI3JTJGQ012TktpMGg0RWw3ZVVqU3ZrdHhaWEdkV25FclpoSGQ4OVAlMkZZMGRBQk5BWnFJ
UGlGYVZVc09MMTFqZm1PLWl6QU1QM3ZocUpsZGpKYXNXbFZ3Wk5FcTB1U1ZLOTNEQzU3YWR1WHJH
VW1HeSUyQnZzaHo3SFBpNzVRM1AzOSUyQiUyRkstdTNrT3RCNVI1eG5GdEVWaiZpZD1CNyUyRkNN
dk5LaTBoNEVsN2VValN2a3R4WlhHZFduRXJaaEhkODlQJTJGWTBkQUJOQVpxSVBpRmFWVXNPTDEx
amZtTyZyY3B0PWl6QU1QM3ZocUpsZGpKYXNXbFZ3Wk5FcTB1U1ZLOTNEQzU3YWR1WHJHVW1HeSUy
QnZzaHo3SFBpNzVRM1AzOSUyQiUyRksmaT11M2tPdEI1UjV4bkZ0RVZqIj4=

------=_Part_145495_603424855.1752061375838--


--===============1316725731702827091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1316725731702827091==--


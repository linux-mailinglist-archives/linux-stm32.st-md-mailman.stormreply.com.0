Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B787AFDD2D
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 03:59:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3D68C36B3C;
	Wed,  9 Jul 2025 01:59:20 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19398C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 01:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=3gpG00SWB5FaIkV+Qhh1TvNbxyiZxv19GhnUcSRb8tY=; b=n
 dlhKSWmEMTf3YdCW4K/IqkG1XhUOzBE45I9xR8dr/ZlcriOTV3W7IAYstAKkl8cU
 4GhhLJbb7VrAJd7aig27YgUF7jNzXkAwVT38ZVyr/3TULlZTbuMnGoncubf8kL4j
 ncGkddO8shcniawxnS1WFKv/1bVreCZ99h2DVpjYWg=
Received: from sensor1010$163.com ( [61.155.242.146] ) by
 ajax-webmail-wmsvr-40-106 (Coremail) ; Wed, 9 Jul 2025 09:57:50 +0800 (CST)
X-Originating-IP: [61.155.242.146]
Date: Wed, 9 Jul 2025 09:57:50 +0800 (CST)
From: lizhe  <sensor1010@163.com>
To: "Andrew Lunn" <andrew@lunn.ch>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
X-CM-CTRLMSGS: oP/bEHRyYWNlS2V5PXByZV84NzdjMWJlMjUyYWEyNTc3ZTVjZjM3YjdjZWUyZ
 TJhMQ==
X-NTES-SC: AL_Qu2eAPyZuUos5iedZ+kfmU4WhO47Ucewvfwu1IBUNpx6jCDp/iwNfH1TGVnn4sWDBASLkAiHXSle09hifYt/bqUgetbNPCvHWaFbtptDIYF1eg==
MIME-Version: 1.0
Message-ID: <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: aigvCgDnL_mezG1ohIsFAA--.37606W
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiEAKEq2htSoXT6wADsM
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Cc: linux-kernel@vger.kernel.org, vladimir.oltean@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
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
Content-Type: multipart/mixed; boundary="===============7188816669619012069=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============7188816669619012069==
Content-Type: multipart/alternative; 
	boundary="----=_Part_24224_2753782.1752026270757"

------=_Part_24224_2753782.1752026270757
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGmjrCBBbmRyZXcKClRoeCwKCgoKCmkgY29uZHVjdGVkIGFuIGV4cGVyaW1lbnQsIGFuZCBubyBt
YXR0ZXIgd2hldGhlciBpIGNvbmZpZ3VyZWQgaXQgYXMgCgpHUElPX0FDVElWRV9MT1cgb3IgR1BJ
T19BQ1RJVkVfSElHSCBpbiB0aGUgZHRzLCB0aGUgcmVzdWx0aW5nCgpHUElPIHBpbiBzdGF0ZSB3
YXMgMCwgaW5kaWNhdGluZyBhIGxvdyBsZXZlbC4KCgoKCgoKCmlmIChkZWxheXNbMl0pCgogICAg
bXNsZWVwKERJVl9ST1VORF9VUChERUxBWVNbMl0sIDEwMDApKTsKCgoKCisgZ3Bpb19zdGF0ZSA9
IGdwaW9kX2dldF92YWx1ZV9jYW5fc2xlZXAocmVzZXRfZ3Bpbyk7CgorIHByX2luZm8oImdwaW9f
c3RhdGU6ICVkXG4iLCBncGlvX3N0YXRlKTsKCgoKCgpBdCAyMDI1LTA3LTA5IDAxOjM0OjA3LCAi
QW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj5PbiBUdWUsIEp1bCAwOCwgMjAy
NSBhdCAwOTo1MDo0NEFNIC0wNzAwLCBMaXpoZSB3cm90ZToKPj4gc29tZSBkZXZpY2VzIG9ubHkg
cmVzZXQgd2hlbiB0aGUgR1BJTyBpcyBhdCBhIGhpZ2ggbGV2ZWwsIGJ1dCB0aGUKPj4gY3VycmVu
dCBmdW5jdGlvbiBsYWNrcyBzdXBwb3J0IGZvciBzdWNoIGRldmljZXMuIGFkZCBoaWdoLWxldmVs
Cj4+IHJlc2V0IGZ1bmN0aW9uYWxpdHkgdG8gdGhlIGZ1bmN0aW9uIHRvIHN1cHBvcnQgZGV2aWNl
cyB0aGF0IHJlcXVpcmUKPj4gaGlnaC1sZXZlbCB0cmlnZ2VyaW5nIGZvciByZXNldAo+Cj5Zb3Ug
Y2FuIHByb2JhYmx5IHNwZWNpZnkgdGhpcyBpbiBEVDoKPgo+cmVzZXQtZ3Bpb3MgPSA8JnFlX3Bp
b19lIDE4IEdQSU9fQUNUSVZFX0xPVz47Cj4KPlRoZSBncGlvIGNvcmUgd2lsbCB0aGVuIGZsaXAg
dGhlIG1lYW5pbmcgb2YKPgo+Z3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHJlc2V0X2dwaW8sIDEp
Owo+Cj5zdWNoIHRoYXQgYSB2YWx1ZSBvZiAxIHdpbGwgYmVjb21lIGxvdywgMCB3aWxsIGJlY29t
ZSBoaWdoLgo+Cj4gICAgIEFuZHJldwo=
------=_Part_24224_2753782.1752026270757
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBkYXRhLW50ZXM9Im50ZXNfbWFpbF9ib2R5X3Jvb3QiIHN0eWxlPSJsaW5lLWhlaWdodDox
Ljc7Y29sb3I6IzAwMDAwMDtmb250LXNpemU6MTRweDtmb250LWZhbWlseTpBcmlhbCI+PGRpdiBp
ZD0ic3BuRWRpdG9yQ29udGVudCI+PHAgc3R5bGU9Im1hcmdpbjogMDsiPkhpo6wgQW5kcmV3PGJy
Pjxicj5UaHgsPC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJn
aW46IDA7Ij5pIGNvbmR1Y3RlZCBhbiBleHBlcmltZW50LCBhbmQgbm8gbWF0dGVyIHdoZXRoZXIg
aSBjb25maWd1cmVkIGl0IGFzJm5ic3A7PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij5HUElPX0FD
VElWRV9MT1cgb3IgR1BJT19BQ1RJVkVfSElHSCBpbiB0aGUgZHRzLCB0aGUgcmVzdWx0aW5nPC9w
PjxwIHN0eWxlPSJtYXJnaW46IDA7Ij5HUElPIHBpbiBzdGF0ZSB3YXMgMCwgaW5kaWNhdGluZyBh
IGxvdyBsZXZlbC48L3A+PHAgc3R5bGU9Im1hcmdpbjogMDsiPjxicj48L3A+PHAgc3R5bGU9Im1h
cmdpbjogMDsiPjxicj48L3A+PHAgc3R5bGU9Im1hcmdpbjogMDsiPmlmIChkZWxheXNbMl0pPC9w
PjxwIHN0eWxlPSJtYXJnaW46IDA7Ij4mbmJzcDsgJm5ic3A7IG1zbGVlcChESVZfUk9VTkRfVVAo
REVMQVlTWzJdLCAxMDAwKSk7PC9wPjxwIHN0eWxlPSJtYXJnaW46IDA7Ij48YnI+PC9wPjxwIHN0
eWxlPSJtYXJnaW46IDA7Ij4rIGdwaW9fc3RhdGUgPSBncGlvZF9nZXRfdmFsdWVfY2FuX3NsZWVw
KHJlc2V0X2dwaW8pOzwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+KyBwcl9pbmZvKCJncGlvX3N0
YXRlOiAlZFxuIiwgZ3Bpb19zdGF0ZSk7PC9wPjwvZGl2PjxkaXYgc3R5bGU9InBvc2l0aW9uOnJl
bGF0aXZlO3pvb206MSI+PC9kaXY+PGRpdiBpZD0iZGl2TmV0ZWFzZU1haWxDYXJkIj48L2Rpdj48
cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cHJlPjxicj5BdCAyMDI1LTA3LTA5IDAxOjM0
OjA3LCAiQW5kcmV3IEx1bm4iICZsdDthbmRyZXdAbHVubi5jaCZndDsgd3JvdGU6CiZndDtPbiBU
dWUsIEp1bCAwOCwgMjAyNSBhdCAwOTo1MDo0NEFNIC0wNzAwLCBMaXpoZSB3cm90ZToKJmd0OyZn
dDsgc29tZSBkZXZpY2VzIG9ubHkgcmVzZXQgd2hlbiB0aGUgR1BJTyBpcyBhdCBhIGhpZ2ggbGV2
ZWwsIGJ1dCB0aGUKJmd0OyZndDsgY3VycmVudCBmdW5jdGlvbiBsYWNrcyBzdXBwb3J0IGZvciBz
dWNoIGRldmljZXMuIGFkZCBoaWdoLWxldmVsCiZndDsmZ3Q7IHJlc2V0IGZ1bmN0aW9uYWxpdHkg
dG8gdGhlIGZ1bmN0aW9uIHRvIHN1cHBvcnQgZGV2aWNlcyB0aGF0IHJlcXVpcmUKJmd0OyZndDsg
aGlnaC1sZXZlbCB0cmlnZ2VyaW5nIGZvciByZXNldAomZ3Q7CiZndDtZb3UgY2FuIHByb2JhYmx5
IHNwZWNpZnkgdGhpcyBpbiBEVDoKJmd0OwomZ3Q7cmVzZXQtZ3Bpb3MgPSAmbHQ7JmFtcDtxZV9w
aW9fZSAxOCBHUElPX0FDVElWRV9MT1cmZ3Q7OwomZ3Q7CiZndDtUaGUgZ3BpbyBjb3JlIHdpbGwg
dGhlbiBmbGlwIHRoZSBtZWFuaW5nIG9mCiZndDsKJmd0O2dwaW9kX3NldF92YWx1ZV9jYW5zbGVl
cChyZXNldF9ncGlvLCAxKTsKJmd0OwomZ3Q7c3VjaCB0aGF0IGEgdmFsdWUgb2YgMSB3aWxsIGJl
Y29tZSBsb3csIDAgd2lsbCBiZWNvbWUgaGlnaC4KJmd0OwomZ3Q7ICAgICBBbmRyZXcKPC9wcmU+
PC9kaXY+PGltZyBzdHlsZT0id2lkdGg6MXB4O2hlaWdodDoxcHgiIHNyYz0iaHR0cHM6Ly9jb3Vu
dC5tYWlsLjE2My5jb20vYmVhY29uL3dlYm1haWwuZ2lmP3R5cGU9d2VibWFpbF9tYWlsdHJhY2Um
YW1wO2d1aWQ9cHJlXzg3N2MxYmUyNTJhYTI1NzdlNWNmMzdiN2NlZTJlMmExIj4=
------=_Part_24224_2753782.1752026270757--


--===============7188816669619012069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============7188816669619012069==--


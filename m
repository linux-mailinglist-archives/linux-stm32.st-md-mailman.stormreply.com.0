Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE0AF00F6
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2019 16:14:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A075C36B0B;
	Tue,  5 Nov 2019 15:14:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5629C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2019 15:14:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xA5F2XXW016060; Tue, 5 Nov 2019 16:14:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=sGcJotaSzAOF4wGBo2lc42IY7N+BpinNhWjk4Wx5zlY=;
 b=NeNQEYXPLvC3WCliUp9foYV7DboksxXg5AylZVZxb3SgTkByJKTqjh4al8hpgwgwC+kw
 KDq8KB+bY+m/l/sPplfQ1h3g2R4FboTw2eX3sStxXNQmYMx+wUSbd+e+qkOFnTbuvB16
 oh2QlH5a05G3/CRmytr5aW7l1TZx8MyIXOG84pD9gAzqPuJlKPipM3xI+E4phHECsjdV
 dGuU7sYCxIuxgh0SuDcunzdaQ6QdFBSIQ/ht29GmniLT0SCWXAatRqmm3duk5wX6ODZJ
 yY+NDtcAk+1n62SgZTGjDI0rmzcKvhblqXCWvBlPCLGo2W6PRYs7pdQs4H3Qi6W0rrE0 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2w1054r40k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 16:14:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9294C10002A;
 Tue,  5 Nov 2019 16:14:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82FD92D3768;
 Tue,  5 Nov 2019 16:14:19 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 5 Nov
 2019 16:14:18 +0100
To: Linus Walleij <linus.walleij@linaro.org>
References: <20191104100908.10880-1-amelie.delaunay@st.com>
 <CACRpkdb1c-NHXDQXYS78VTcGPnJApmxjzZbF_cM8SUknhDiQ4Q@mail.gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <64f8096f-cec6-fef1-5a4e-ddca3bf8c73d@st.com>
Date: Tue, 5 Nov 2019 16:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb1c-NHXDQXYS78VTcGPnJApmxjzZbF_cM8SUknhDiQ4Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-11-05_05:2019-11-05,2019-11-05 signatures=0
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] pinctrl: stmfx: fix valid_mask init
	sequence
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMS81LzE5IDM6MzIgUE0sIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gT24gTW9uLCBOb3Yg
NCwgMjAxOSBhdCAxMTowOSBBTSBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5heUBzdC5j
b20+IAo+IHdyb3RlOgo+IAo+PiBXaXRoIHN0bWZ4X3BpbmN0cmxfZ3Bpb19pbml0X3ZhbGlkX21h
c2sgY2FsbGJhY2ssIGdwaW9fdmFsaWRfbWFzayB3YXMgdXNlZAo+PiB0byBpbml0aWFsaXplIGdw
aW9jaGlwIHZhbGlkX21hc2sgZm9yIGdwaW9saWIuIEJ1dCBncGlvX3ZhbGlkX21hc2sgd2FzIG5v
dAo+PiB5ZXQgaW5pdGlhbGl6ZWQuIGdwaW9fdmFsaWRfbWFzayByZXF1aXJlZCBncGlvLXJhbmdl
cyB0byBiZSByZWdpc3RlcmVkLAo+PiB0aGlzIGlzIHRoZSBjYXNlIGFmdGVyIGdwaW9jaGlwX2Fk
ZF9kYXRhIGNhbGwuIEJ1dCBpbml0X3ZhbGlkX21hc2sKPj4gY2FsbGJhY2sgaXMgYWxzbyBjYWxs
ZWQgdW5kZXIgZ3Bpb2NoaXBfYWRkX2RhdGEuIGdwaW9fdmFsaWRfbWFzawo+PiBpbml0aWFsaXph
dGlvbiBjYW5ub3QgYmUgbW92ZWQgYmVmb3JlIGdwaW9jaGlwX2FkZF9kYXRhIGJlY2F1c2UKPj4g
Z3Bpby1yYW5nZXMgYXJlIG5vdCByZWdpc3RlcmVkLgo+IAo+IFNvcnJ5IGJ1dCB0aGlzIGRvZXNu
J3QgYWRkIHVwLCBsb29rIGF0IHRoaXMgY2FsbCBncmFwaDoKPiAKPiBncGlvY2hpcF9hZGRfZGF0
YSgpCj4gIMKgIGdwaW9jaGlwX2FkZF9kYXRhX3dpdGhfa2V5KCkKPiAgwqDCoMKgIGdwaW9jaGlw
X2FsbG9jX3ZhbGlkX21hc2soKQo+ICDCoMKgwqAgb2ZfZ3Bpb2NoaXBfYWRkKCkKPiAgwqDCoMKg
IG9mX2dwaW9jaGlwX2FkZF9waW5fcmFuZ2UoKQo+ICDCoMKgwqAgZ3Bpb2NoaXBfaW5pdF92YWxp
ZF9tYXNrKCkKPiAKPiBTbyB0aGUgLmluaXRpX3ZhbGlkX21hc2soKSBpcyBjbGVhcmx5IGNhbGxl
ZCAqYWZ0ZXIqCj4gb2ZfZ3Bpb2NoaXBfYWRkX3Bpbl9yYW5nZSgpIHNvIHRoaXMgY2Fubm90IGJl
IHRoZSByZWFsIHJlYXNvbiwKPiBwcm92aWRlZCB0aGF0IHRoZSByYW5nZXMgY29tZSBmcm9tIHRo
ZSBkZXZpY2UgdHJlZS4gQUZBSUNUIHRoYXQKPiBpcyB0aGUgY2FzZSB3aXRoIHRoZSBzdG1meC4K
PiAKPiBDYW4geW91IGNoZWNrIGFuZCBzZWUgaWYgdGhlIHByb2JsZW0gaXMgc29tZXRoaW5nIGVs
c2U/Cj4KCnN0bWZ4X3BpbmN0cmxfZ3Bpb19pbml0X3ZhbGlkX21hc2sgdXNlcyBwY3RsLT5ncGlv
X3ZhbGlkX21hc2sgdG8gCmluaXRpYWxpemUgZ3Bpb2NoaXAgdmFsaWRfbWFzay4KCnBjdGwtPmdw
aW9fdmFsaWRfbWFzayBpcyBpbml0aWFsaXplZCBpbiAKc3RtZnhfcGluY3RybF9ncGlvX2Z1bmN0
aW9uX2VuYWJsZSBkZXBlbmRpbmcgb24gZ3BpbyByYW5nZXMuCgpzdG1meF9waW5jdHJsX2dwaW9f
ZnVuY3Rpb25fZW5hYmxlIGlzIGNhbGxlZCBhZnRlciBncGlvY2hpcF9hZGRfZGF0YSAKYmVjYXVz
ZSBpdCByZXF1aXJlcyBncGlvIHJhbmdlcyB0byBiZSByZWdpc3RlcmVkLgoKU28sIGluIHN0bWZ4
IGRyaXZlciB0aGUgY2FsbCBncmFwaCBpcwoKc3RtZnhfcGluY3RybF9wcm9iZQogICBncGlvY2hp
cF9hZGRfZGF0YSgpCiAgICAgZ3Bpb2NoaXBfYWRkX2RhdGFfd2l0aF9rZXkoKQogICAgICAgZ3Bp
b2NoaXBfYWxsb2NfdmFsaWRfbWFzaygpCiAgICAgICBvZl9ncGlvY2hpcF9hZGQoKQogICAgICAg
b2ZfZ3Bpb2NoaXBfYWRkX3Bpbl9yYW5nZSgpCiAgICAgICBncGlvY2hpcF9pbml0X3ZhbGlkX21h
c2soKQogICAgICAgICBzdG1meF9waW5jdHJsX2dwaW9faW5pdF92YWxpZF9tYXNrIChidXQgcGN0
bC0+Z3Bpb192YWxpZF9tYXNrIAppcyBub3QgeWV0IGluaXRpYWxpemVkIHNvIGdwaW9jaGlwIHZh
bGlkX21hc2sgaXMgd3JvbmcpCiAgIHN0bWZ4X3BpbmN0cmxfZ3Bpb19mdW5jdGlvbl9lbmFibGUg
KHBjdGwtPmdwaW9fdmFsaWRfbWFzayBpcyBnb2luZyB0byAKYmUgaW5pdGlhbGl6ZWQgdGhhbmtz
IHRvIGdwaW8gcmFuZ2VzKQoKV2hlbiBjb25zdW1lciB0cmllcyB0byB0YWtlIGEgcGluIChpdCBp
cyB0aGUgY2FzZSBmb3IgdGhlIGpveXN0aWNrIG9uIApzdG0zMm1wMTU3Yy1ldjEpLCBpdCBnZXRz
IHRoZSBmb2xsb3dpbmcgaXNzdWU6ClsgICAgMy4zNDczOTFdIGlycTogOnNvYzppMmNANDAwMTMw
MDA6c3RtZnhANDI6c3RtZngtcGluLWNvbnRyb2xsZXIgCmRpZG4ndCBsaWtlIGh3aXJxLTB4MCB0
byBWSVJROTIgbWFwcGluZyAocmM9LTYpClsgICAgMy4zNTY0MThdIGlycTogOnNvYzppMmNANDAw
MTMwMDA6c3RtZnhANDI6c3RtZngtcGluLWNvbnRyb2xsZXIgCmRpZG4ndCBsaWtlIGh3aXJxLTB4
MSB0byBWSVJROTIgbWFwcGluZyAocmM9LTYpClsgICAgMy4zNjY1MTJdIGlycTogOnNvYzppMmNA
NDAwMTMwMDA6c3RtZnhANDI6c3RtZngtcGluLWNvbnRyb2xsZXIgCmRpZG4ndCBsaWtlIGh3aXJx
LTB4MiB0byBWSVJROTIgbWFwcGluZyAocmM9LTYpClsgICAgMy4zNzY2NzFdIGlycTogOnNvYzpp
MmNANDAwMTMwMDA6c3RtZnhANDI6c3RtZngtcGluLWNvbnRyb2xsZXIgCmRpZG4ndCBsaWtlIGh3
aXJxLTB4MyB0byBWSVJROTIgbWFwcGluZyAocmM9LTYpClsgICAgMy4zODcxNjldIGlycTogOnNv
YzppMmNANDAwMTMwMDA6c3RtZnhANDI6c3RtZngtcGluLWNvbnRyb2xsZXIgCmRpZG4ndCBsaWtl
IGh3aXJxLTB4NCB0byBWSVJROTIgbWFwcGluZyAocmM9LTYpClsgICAgMy4zOTcwNjVdIGdwaW8t
a2V5cyBqb3lzdGljazogRm91bmQgYnV0dG9uIHdpdGhvdXQgZ3BpbyBvciBpcnEKWyAgICAzLjQw
MzA0MV0gZ3Bpby1rZXlzOiBwcm9iZSBvZiBqb3lzdGljayBmYWlsZWQgd2l0aCBlcnJvciAtMjIK
CkkgY2FuIHJld29yZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gbWFrZSBpdCBjbGVhcmVyLgoKUmVn
YXJkcywKQW1lbGllCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==

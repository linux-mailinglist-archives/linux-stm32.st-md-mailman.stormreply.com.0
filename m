Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F799275CBD
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 18:04:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF8E6C3FAD5;
	Wed, 23 Sep 2020 16:04:44 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 273BBC32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 16:04:43 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BxNKk10RDz1rwbQ;
 Wed, 23 Sep 2020 18:04:42 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BxNKk0Nn1z1qwT6;
 Wed, 23 Sep 2020 18:04:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id bPbLAtAUWko4; Wed, 23 Sep 2020 18:04:40 +0200 (CEST)
X-Auth-Info: 89/vV8HHoNJ5LmKqvBxdZ3GUpzKhb3OjMwkY+NzsReM=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 23 Sep 2020 18:04:40 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200822203255.61295-1-marex@denx.de>
 <f6e8619d-ff66-2f70-d22e-88ed763cf96c@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <a3c0348b-bf5e-0382-6a6e-bbf74f5a00ce@denx.de>
Date: Wed, 23 Sep 2020 18:04:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f6e8619d-ff66-2f70-d22e-88ed763cf96c@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix DH PDK2 display PWM
	channel
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gOS8yMy8yMCA0OjMyIFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IEhpIE1hcmVrCgpI
aSwKCj4gT24gOC8yMi8yMCAxMDozMiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IFRoZSBkaXNw
bGF5IFBXTSBjaGFubmVsIGlzIG51bWJlciAzIChQV00yIENINCksIG1ha2UgaXQgc28uCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiBDYzogQWxleGFu
ZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+Cj4+IENjOiBNYXhpbWUgQ29xdWVs
aW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+IENjOiBQYXRyaWNlIENob3RhcmQgPHBh
dHJpY2UuY2hvdGFyZEBzdC5jb20+Cj4+IENjOiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRl
bGF1bmF5QHN0LmNvbT4KPj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KPj4gVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiAtLS0K
Pj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGRrMi5kdHNpIHwgMiAr
LQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLXBkazIu
ZHRzaQo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLXBkazIuZHRzaQo+
PiBpbmRleCA3YzRiZDYxNWIzMTEuLjA3NWUyYTk1NzEzZiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb20tcGRrMi5kdHNpCj4+ICsrKyBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29tLXBkazIuZHRzaQo+PiBAQCAtMjYsNyArMjYsNyBA
QCBjbGtfZXh0X2F1ZGlvX2NvZGVjOiBjbG9jay1jb2RlYyB7Cj4+IMKgIMKgwqDCoMKgwqAgZGlz
cGxheV9ibDogZGlzcGxheS1ibCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0g
InB3bS1iYWNrbGlnaHQiOwo+PiAtwqDCoMKgwqDCoMKgwqAgcHdtcyA9IDwmcHdtMiAwIDUwMDAw
MCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+PiArwqDCoMKgwqDCoMKgwqAgcHdtcyA9IDwmcHdt
MiAzIDUwMDAwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
YnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCAxNiAyMiAzMCA0MCA1NSA3NSAxMDIgMTM4IDE4OCAyNTU+
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsID0gPDg+Owo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZW5hYmxlLWdwaW9zID0gPCZncGlvaSAwIEdQSU9fQUNUSVZF
X0hJR0g+Owo+Pgo+IAo+IAo+IEFwcGxpZWQgb24gc3RtMzItbmV4dC4KCkRvbid0IHlvdSB3YW50
IHRvIHBpY2sgdGhlIG9uZSB3aXRoIHRoZSBGaXhlczogdGFnID8gOikKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

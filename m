Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 316CD3C3578
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jul 2021 18:08:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3619C57B60;
	Sat, 10 Jul 2021 16:08:28 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FE1EC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 16:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B+ZumVvqvu+0mUwwUiQ31zStVAZut8y1rEf5GPLOqS8=; b=TSONfkWJaEHlQg2MvrF2pcumkZ
 X2DLQGMS4PSWljs2brnP2gi0ctBmbjOb/9SzsWntr5wpJBhLo4NFunu06WXdMIU26C9JAnKzwIO97
 rNMl7XI1jQYqNHNDovl9nsmdF8DdA0mPdHSQj3NSMCXXMXXEh//YAh3QrBDc40qFbmYvp8QUq2O3F
 7dP+q/ZJqhFvAuT2yf8W2P9UNgn4CxtSsPglFpnB8Sbx4uvyS+SloonH3laoYfqUvWIGb9/XSxYzU
 pm6Y1ujFt3in4LpPFizU/C1JpmOj/RCHvjS1Fsenek/4grjGYnQwupo+/pxtfwjC+YBquhu9GsofB
 YLJ/HWqw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:46002 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1m2FWS-00GZ0l-Nv; Sat, 10 Jul 2021 12:08:23 -0400
From: David Lechner <david@lechnology.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <e298043c880b350a42bdc40452376a3708bf533b.1625471640.git.vilhelm.gray@gmail.com>
 <1a624011-0b43-ac42-be53-a42f81923e5a@linux.intel.com>
 <YOl1frCrophjhk7y@shinobu>
 <fbf1ba4c-412b-fe22-0e79-76e968a00fb4@lechnology.com>
Message-ID: <76cc7f77-a59c-86ef-8df9-65b877356b32@lechnology.com>
Date: Sat, 10 Jul 2021 11:08:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fbf1ba4c-412b-fe22-0e79-76e968a00fb4@lechnology.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 o.rempel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 15/17] counter: Implement
 events_queue_size sysfs attribute
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

T24gNy8xMC8yMSAxMDo0MyBBTSwgRGF2aWQgTGVjaG5lciB3cm90ZToKPiBPbiA3LzEwLzIxIDU6
MjUgQU0sIFdpbGxpYW0gQnJlYXRoaXR0IEdyYXkgd3JvdGU6Cj4+PiBhbmQgYWZ0ZXIgdGhhdAo+
Pj4KPj4+IFvCoMKgIDE2LjU2NDQwM10gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09Cj4+PiBbwqDCoCAxNi41NzA3MjVdIFdBUk5JTkc6IGxvY2sgaGVsZCB3
aGVuIHJldHVybmluZyB0byB1c2VyIHNwYWNlIQo+Pj4gW8KgwqAgMTYuNTc3MDQ0XSA1LjEzLjAt
bmV4dC0yMDIxMDcwNisgIzQgTm90IHRhaW50ZWQKPj4+IFvCoMKgIDE2LjU4MjE5OF0gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiBbwqDCoCAxNi41
ODg1MDddIGNhdC8zMzEgaXMgbGVhdmluZyB0aGUga2VybmVsIHdpdGggbG9ja3Mgc3RpbGwgaGVs
ZCEKPj4+IFvCoMKgIDE2LjU5NTIxNF0gMSBsb2NrIGhlbGQgYnkgY2F0LzMzMToKPj4+IFvCoMKg
IDE2LjU5OTEwM13CoCAjMDogZmZmZjg4ODEwMmJiMzYzMAo+Pj4gKCZjb3VudGVyLT5jaHJkZXZf
bG9jayl7Ky4rLn0tezM6M30sIGF0OiBjb3VudGVyX2NocmRldl9vcGVuKzB4MjEvMHg2MAo+Pj4g
W2NvdW50ZXJdCj4+Pgo+Pj4gSmFya2tvCj4+IEknbSBub3Qgc3VyZSBob3cgdG8gcmVzb2x2ZSB0
aGlzIHdhcm5pbmcuIFRoZSBwdXJwb3NlIG9mIHRoaXMgbG9jayBpcyB0bwo+PiBsaW1pdCBjaHJk
ZXYgdG8gYSBzaW5nbGUgb3BlbiBhdCBhIHRpbWUuIFRvIGFjY29tcGxpc2ggdGhpcyBJIGdyYWIg
dGhpcwo+PiBsb2NrIGluIGNvdW50ZXJfY2hyZGV2X29wZW4oKSBhbmQgaG9sZCBpdCB1bnRpbCBj
b3VudGVyX2NocmRldl9yZWxlYXNlKCkKPj4gaXMgY2FsbGVkLiBJcyB0aGVyZSBhIGJldHRlciB3
YXkgdG8gYWNjb21wbGlzaCB0aGlzPwo+IAo+IEhvdyBhYm91dCB1c2luZyBhbiBhdG9taWMgZmxh
ZywgZS5nIHRlc3RfYW5kX3NldF9iaXQoKT8KCkFub3RoZXIgb3B0aW9uIGNvdWxkIGJlIHRvIHJl
dGhpbmsgaXQgYXQgYSBoaWdoZXIgbGV2ZWwgYW5kIGF2b2lkIHRoZQpuZWVkIGZvciBhIGxvY2sg
KGFuZCBzeXNmcyBhdHRyaWJ1dGUpIGFsdG9nZXRoZXIuIEZvciBleGFtcGxlLCB3b3VsZCBpdAp3
b3JrIHRvIChyZSlhbGxvY2F0ZSB0aGUga2ZpZm8gYnVmZmVyIGluIHRoZSBDT1VOVEVSX0VOQUJM
RV9FVkVOVFNfSU9DVEwKY2FsbGJhY2sgYW5kIGFkZCBhIHBhcmFtZXRlciB0byB0aGF0IGlvY3Rs
IHRvIHNwZWNpZnkgdGhlIGJ1ZmZlciBzaXplCih3aXRoIHVuaXRzIG9mIGV2ZW50cyByYXRoZXIg
dGhhbiBieXRlcyk/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=

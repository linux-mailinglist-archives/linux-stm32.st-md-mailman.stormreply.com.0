Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CB53C35F2
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jul 2021 19:54:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73561C57B60;
	Sat, 10 Jul 2021 17:54:07 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9462EC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jul 2021 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Am0uhBAEXHiTgENkWsIrhc4uV4GJPpvn66MI5SePOo=; b=CiU+TKI7eo3mcppV0+grIy+B5u
 DqJZFdNCcSQt4IeCv7CmdSltFxiMB+/148PKt8QttcMNsitS9cOCm1k7VA3NmZgTi1DWVfGNS6quZ
 lEQ0md6oL08VAS4RZwcBUYzYhsxKhDEIRly64+d2RcO6z+aXalY/svt7hPSvDHq3RLe6To17uEDHt
 0MhsFppUfxmXrw6FYbFJZ3YKHT7idoneijCb+hnZSjSHV55saXmVl4Hrgu63R96RZdEJmCFiGac/O
 vUiGjXxqY6ZnwxLME2hIFUA9b/v068Te5tSyA08S3OP9nzXWQjrjqYeWPvUy9oORn8zLRIzMHRKZU
 L6Q8glwQ==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:47624 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1m2HAe-00GsEC-IC; Sat, 10 Jul 2021 13:53:59 -0400
From: David Lechner <david@lechnology.com>
To: William Breathitt Gray <vilhelm.gray@gmail.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <e298043c880b350a42bdc40452376a3708bf533b.1625471640.git.vilhelm.gray@gmail.com>
 <1a624011-0b43-ac42-be53-a42f81923e5a@linux.intel.com>
 <YOl1frCrophjhk7y@shinobu>
 <fbf1ba4c-412b-fe22-0e79-76e968a00fb4@lechnology.com>
 <76cc7f77-a59c-86ef-8df9-65b877356b32@lechnology.com>
Message-ID: <f1c57abc-cb68-c00c-3037-dc53c0adab1a@lechnology.com>
Date: Sat, 10 Jul 2021 12:53:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <76cc7f77-a59c-86ef-8df9-65b877356b32@lechnology.com>
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

T24gNy8xMC8yMSAxMTowOCBBTSwgRGF2aWQgTGVjaG5lciB3cm90ZToKPiBPbiA3LzEwLzIxIDEw
OjQzIEFNLCBEYXZpZCBMZWNobmVyIHdyb3RlOgo+PiBPbiA3LzEwLzIxIDU6MjUgQU0sIFdpbGxp
YW0gQnJlYXRoaXR0IEdyYXkgd3JvdGU6Cj4+Pj4gYW5kIGFmdGVyIHRoYXQKPj4+Pgo+Pj4+IFvC
oMKgIDE2LjU2NDQwM10gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Cj4+Pj4gW8KgwqAgMTYuNTcwNzI1XSBXQVJOSU5HOiBsb2NrIGhlbGQgd2hlbiByZXR1
cm5pbmcgdG8gdXNlciBzcGFjZSEKPj4+PiBbwqDCoCAxNi41NzcwNDRdIDUuMTMuMC1uZXh0LTIw
MjEwNzA2KyAjNCBOb3QgdGFpbnRlZAo+Pj4+IFvCoMKgIDE2LjU4MjE5OF0gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4gW8KgwqAgMTYuNTg4NTA3
XSBjYXQvMzMxIGlzIGxlYXZpbmcgdGhlIGtlcm5lbCB3aXRoIGxvY2tzIHN0aWxsIGhlbGQhCj4+
Pj4gW8KgwqAgMTYuNTk1MjE0XSAxIGxvY2sgaGVsZCBieSBjYXQvMzMxOgo+Pj4+IFvCoMKgIDE2
LjU5OTEwM13CoCAjMDogZmZmZjg4ODEwMmJiMzYzMAo+Pj4+ICgmY291bnRlci0+Y2hyZGV2X2xv
Y2speysuKy59LXszOjN9LCBhdDogY291bnRlcl9jaHJkZXZfb3BlbisweDIxLzB4NjAKPj4+PiBb
Y291bnRlcl0KPj4+Pgo+Pj4+IEphcmtrbwo+Pj4gSSdtIG5vdCBzdXJlIGhvdyB0byByZXNvbHZl
IHRoaXMgd2FybmluZy4gVGhlIHB1cnBvc2Ugb2YgdGhpcyBsb2NrIGlzIHRvCj4+PiBsaW1pdCBj
aHJkZXYgdG8gYSBzaW5nbGUgb3BlbiBhdCBhIHRpbWUuIFRvIGFjY29tcGxpc2ggdGhpcyBJIGdy
YWIgdGhpcwo+Pj4gbG9jayBpbiBjb3VudGVyX2NocmRldl9vcGVuKCkgYW5kIGhvbGQgaXQgdW50
aWwgY291bnRlcl9jaHJkZXZfcmVsZWFzZSgpCj4+PiBpcyBjYWxsZWQuIElzIHRoZXJlIGEgYmV0
dGVyIHdheSB0byBhY2NvbXBsaXNoIHRoaXM/Cj4+Cj4+IEhvdyBhYm91dCB1c2luZyBhbiBhdG9t
aWMgZmxhZywgZS5nIHRlc3RfYW5kX3NldF9iaXQoKT8KPiAKPiBBbm90aGVyIG9wdGlvbiBjb3Vs
ZCBiZSB0byByZXRoaW5rIGl0IGF0IGEgaGlnaGVyIGxldmVsIGFuZCBhdm9pZCB0aGUKPiBuZWVk
IGZvciBhIGxvY2sgKGFuZCBzeXNmcyBhdHRyaWJ1dGUpIGFsdG9nZXRoZXIuIEZvciBleGFtcGxl
LCB3b3VsZCBpdAo+IHdvcmsgdG8gKHJlKWFsbG9jYXRlIHRoZSBrZmlmbyBidWZmZXIgaW4gdGhl
IENPVU5URVJfRU5BQkxFX0VWRU5UU19JT0NUTAo+IGNhbGxiYWNrIGFuZCBhZGQgYSBwYXJhbWV0
ZXIgdG8gdGhhdCBpb2N0bCB0byBzcGVjaWZ5IHRoZSBidWZmZXIgc2l6ZQo+ICh3aXRoIHVuaXRz
IG9mIGV2ZW50cyByYXRoZXIgdGhhbiBieXRlcyk/Cj4gCgpUaGlua2luZyBhYm91dCBpdCBhIGJp
dCBtb3JlLCB0aGlzIHByb2JhYmx5IGlzbid0IGEgZ29vZCBzdWdnZXN0aW9uLgpJdCB3b3VsZCBj
cmVhdGUgaXNzdWVzIHdpdGggYmVpbmcgYWJsZSB0byBzdGFydCByZWFkaW5nIGZyb20gdGhlIGNo
cmRldgpiZWZvcmUgZW5hYmxpbmcgZXZlbnRzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

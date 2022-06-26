Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28D55ADC8
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Jun 2022 02:34:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9928DC5E2CC;
	Sun, 26 Jun 2022 00:34:56 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA46DC0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Jun 2022 00:34:54 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5F8D782140;
 Sun, 26 Jun 2022 02:34:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656203694;
 bh=NjI73YIYt3DsJe+gVtpQjsXqc5MQTjIYbV+qStyLS3I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KmqOwR/eZWR6QtQg2qFR7DKU/jBHxPI+W0bd1IOTN+Wq+Fu93QluZ5fnZniRiiD1s
 Q4m0sORUB8/43QtQsgsVi3eKFLLVI6GNaZ1OZEeR8Yj8maxBSR6ZFPfF/NTSc/I0OL
 8WzGKvaCxqxGb66+XjUb0STwUoG/J9P4MeEdSi/5vO2b/TPm5IMUF8ij3aLZ0VN1ic
 FtdnnJL0McGBpwooBK8RdxVXhCzCxa0hkhwNJ2i4XX+udl/3vadJHro3NkkD5mr/WS
 S0TBz9S2oS5iSJERa87YX0GijL9Z2mLirKweclorPkSDeEnZiHwyyrcXwVEEN9LQ4Z
 7ZOqrYqmHojGg==
Message-ID: <65dc289c-9fbb-024e-b8ae-b7906cf0114e@denx.de>
Date: Sun, 26 Jun 2022 02:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220615233310.90593-1-marex@denx.de>
 <3d992f4d-e494-86d0-9e43-a4912f87e1d0@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <3d992f4d-e494-86d0-9e43-a4912f87e1d0@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix SPI2 pinmux pin
	comments
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

T24gNi8yMC8yMiAxNzoyMSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBNYXJlawoKSGVs
bG8gQWxleGFuZHJlLAoKPiBPbiA2LzE2LzIyIDAxOjMzLCBNYXJlayBWYXN1dCB3cm90ZToKPj4g
VGhvc2UgcGluIGNvbW1lbnRzIHJlZmVyIHRvIFNQSTIgcGlucywgbm90IFNQSTEgcGlucywgdXBk
YXRlIHRoZSAKPj4gY29tbWVudHMuCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKWy4uLl0KCj4+
IMKgwqDCoMKgwqAgc3BpMl9waW5zX2I6IHNwaTItMSB7Cj4gCj4gSSBkb24ndCBoYXZlIHRoaXMg
cmVmZXJlbmNlIChzcGkyLTEpLiBEbyBJIG1pc3Mgc29tZXRoaW5nID8KCkkgaGFkIHRoZSBEUkMg
Q29tcGFjdCBzZXJpZXMgaW4gbXkgdHJlZSBiZWZvcmUgdGhpcyBwYXRjaCwgc29ycnkuIEkgCnVw
ZGF0ZWQgYm90aCB0aGlzIHBhdGNoIGFuZCB0aGUgRFJDIENvbXBhY3Qgc2VyaWVzIGFuZCBzdWJt
aXR0ZWQgVjIgYW5kIApWMyByZXNwZWN0aXZlbHkuCgpGb3IgdGhlIHNha2Ugb2Ygc2ltcGxpY2l0
eSwgYmVsb3cgYXJlIFBXIGxpbmtzIHRvIHRoZSBsYXRlc3QgdmVyc2lvbnMgb2YgCmFsbCBvdXRz
dGFuZGluZyBwYXRjaGVzLiBUaGVyZSBhcmUgYWxzbyBBVjk2IERDTUkgcGF0Y2hlcyBpbiB0aGVy
ZToKCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hcm0ta2VybmVs
L2xpc3QvP3Nlcmllcz02NDQyMTYmc3RhdGU9JTJBJmFyY2hpdmU9Ym90aAoKaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LWFybS1rZXJuZWwvcGF0Y2gvMjAyMjA2MjYw
MDE1NTkuMTk4Njg5LTEtbWFyZXhAZGVueC5kZS8KCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC1hcm0ta2VybmVsL2xpc3QvP3Nlcmllcz02NTM4NjMmc3RhdGU9JTJB
JmFyY2hpdmU9Ym90aAoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBpbnMxIHsKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnSScsIDEsIEFGNSk+LCAvKiBT
UEkxX1NDSyAqLwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJ
Tk1VWCgnSScsIDMsIEFGNSk+OyAvKiBTUEkxX01PU0kgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnSScsIDEsIEFGNSk+LCAvKiBTUEkyX1NDSyAq
Lwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSScs
IDMsIEFGNSk+OyAvKiBTUEkyX01PU0kgKi8KClsuLi5dCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==

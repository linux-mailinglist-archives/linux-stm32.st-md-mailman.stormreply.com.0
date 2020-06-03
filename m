Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3DD1ED845
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jun 2020 00:01:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6C94C36B21;
	Wed,  3 Jun 2020 22:01:36 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6ACF5C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 22:01:32 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id q188so840981ooq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jun 2020 15:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+06hodQysHDpNsjgZkygN56Nz2rPEoF5BWYIAZ/Qdgo=;
 b=bF61ExSYvFwaJ/aZrOavLD1lfkjFx9k6Qh+wiZ3qpK++ZfbHg8wPx9ADsroGtfG0Oo
 LD2TW7rd1u1LvoReGysai8PE/SafEbSdsKWJe6VllKnIM2STu5j0QdP2SupGyzglCIvm
 e88nTqOkQluFBVCbhxLKLKCsayuwZDaxDpa5CJb9HZShdMxLIkn37w08Aoc5/s2gGLtM
 FOYhKwnOCOqYpQrkf7fauDwvNJWbUep9dOKicR0OupUp6vcffbsTJalci2vSfWzesR+S
 ct0JOj8533etWkNlg6XrvZ7UXDR0KYsED3KTLKbm25IyjdlA4R3aCrDYi7rPDR5/fmd7
 QMxw==
X-Gm-Message-State: AOAM5336zvutHrW+wWtI/iDavV+xvjoNsx9uoMzCxqI7B8amDveXwlB0
 BvJs5gsDq+14iBifd2Wpyj8VRN4vHM7YO+3O22Q=
X-Google-Smtp-Source: ABdhPJw2dvLU83LDOWGT3Ey3MICfHVX0fif6rBgcuJmgPR+tbro9yGk/hxuKrku9g4yCfFqkljto2jY7BsgBPmTl34k=
X-Received: by 2002:a4a:db4b:: with SMTP id 11mr1580565oot.11.1591221690958;
 Wed, 03 Jun 2020 15:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
In-Reply-To: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2020 00:01:19 +0200
Message-ID: <CAMuHMdU3wMT_pnh4NE9W9Su6qip_oObgd6OiRCwfuvouqjXKHA@mail.gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Navid Emamdoost <emamd001@umn.edu>,
 Qiushi Wu <wu000273@umn.edu>, Stephen McCamant <smccaman@umn.edu>,
 dmaengine <dmaengine@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: call
 pm_runtime_put if pm_runtime_get_sync fails
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

SGkgTWFya3VzLAoKVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQhCgpPbiBXZWQsIEp1biAzLCAyMDIw
IGF0IDg6NTMgUE0gTWFya3VzIEVsZnJpbmcgPE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4gd3JvdGU6
Cj4gPiBDYWxsaW5nIHBtX3J1bnRpbWVfZ2V0X3N5bmMgaW5jcmVtZW50cyB0aGUgY291bnRlciBl
dmVuIGluIGNhc2Ugb2YKPiA+IGZhaWx1cmUsIGNhdXNpbmcgaW5jb3JyZWN0IHJlZiBjb3VudC4g
Q2FsbCBwbV9ydW50aW1lX3B1dCBpZgo+ID4gcG1fcnVudGltZV9nZXRfc3luYyBmYWlscy4KPgo+
IElzIGl0IGFwcHJvcHJpYXRlIHRvIGNvcHkgYSBzZW50ZW5jZSBmcm9tIHRoZSBjaGFuZ2UgZGVz
Y3JpcHRpb24KPiBpbnRvIHRoZSBwYXRjaCBzdWJqZWN0Pwo+Cj4gSG93IGRvIHlvdSB0aGluayBh
Ym91dCBhIHdvcmRpbmcgdmFyaWFudCBsaWtlIHRoZSBmb2xsb3dpbmc/Cj4KPiAgICBUaGUgUE0g
cnVudGltZSByZWZlcmVuY2UgY291bnRlciBpcyBnZW5lcmFsbHkgaW5jcmVtZW50ZWQgYnkgYSBj
YWxsIG9mCj4gICAgdGhlIGZ1bmN0aW9uIOKAnHBtX3J1bnRpbWVfZ2V0X3N5bmPigJ0uCj4gICAg
VGh1cyBjYWxsIHRoZSBmdW5jdGlvbiDigJxwbV9ydW50aW1lX3B1dOKAnSBhbHNvIGluIHR3byBl
cnJvciBjYXNlcwo+ICAgIHRvIGtlZXAgdGhlIHJlZmVyZW5jZSBjb3VudGluZyBjb25zaXN0ZW50
LgoKSU1ITyB0aGUgaW1wb3J0YW50IHBhcnQgaXMgImV2ZW4gaW4gY2FzZSBvZiBmYWlsdXJlIiwg
d2hpY2ggeW91IGRyb3BwZWQuCk1pc3NpbmcgdGhhdCBwb2ludCB3YXMgdGhlIHJvb3QgY2F1c2Ug
b2YgdGhlIGlzc3VlIGJlaW5nIGZpeGVkLgpIZW5jZSBJIHByZWZlciB0aGUgb3JpZ2luYWwgZGVz
Y3JpcHRpb24sIEZXSVcuCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAg
ICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51
eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1
dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIi
IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E32F41ED698
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jun 2020 21:17:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90F6CC36B21;
	Wed,  3 Jun 2020 19:17:23 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05E90C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jun 2020 19:17:20 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id d7so3593687ioq.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jun 2020 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6d7NwLsGT9XBwpif8ssbO5j7lS7Uj+B9cyPHxQfDOJc=;
 b=ADCpHKoU8KPg9vkQLXJpeR2WvdNX3yale3lmsNmB/MlAT85XGugfW6Lj0JQIuZBniy
 pQhMCZLP6wlhfgTC5gyglucH2XVir347K8atgenZhITjMWwV9H9/FwzDEgYd/1YM9O3e
 A/5oqkqKVDG+XvOnHRH4owoIxfCtewEsQ7GGcKqrkVYiBhThb0Q/wzmL+Xhr/MVq2CNd
 /lmNCqfogZR2eRo2oDHe2UGsyCbvTIH13ZQYfXGfDPdPnBu6L4wBqGJFfVIv7dXtGBEG
 8mbWK69KdDvbTbmX5/BgzPHcEdTQaYVxjxlVv+Id4Dzo3tsflxDTgn6MnBaoVQEfc4M+
 xvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6d7NwLsGT9XBwpif8ssbO5j7lS7Uj+B9cyPHxQfDOJc=;
 b=auo9fYUs51yasE4gHjTUq/WBTXuUQot1qbtzkGr3ckBgGYCchmuenyjN1jV+KXkiJx
 5BDA/QNLth7fqNzycTlFht19tRhVrZOJLb/N+wndqWG1489dPzdQDmA0QIpq4oLJu5+D
 +p5gDm9jAZo0Kd+9Aes8fAUT7iQR7BAAQXPTNI8U0ACyDC29xaYZG9LlTn1dDkVfKWWK
 4r548EuKuTmJDeOzXuKAP4D7/nKeYo5nTxl9F/u/Euh8hFABL6NPq64RvJgMwGQ8ekMl
 CUHd9AZQLhaG5nRdx9aWeL3EF8A1iboIGe1XpxQkpemYKhObwopc9tba7OtHHejalkUE
 CL6A==
X-Gm-Message-State: AOAM530aOIPQkr5PmTLsLVvjrP4dt90a6Iyg0AMUOgfr7ZjjuWlh43FF
 sJBxSecaA6qcyJ8Xj0h7dhk+A40QwH8bJPQdjcQ=
X-Google-Smtp-Source: ABdhPJzEkWwXprp+yt91ZkoWfd2FIUCPSY9OM5q2dRIJlmJE+OxklnUcJjSB4jVOukPnhdXpz7ftkqgqD+u6aFWPSPM=
X-Received: by 2002:a02:dc8:: with SMTP id 191mr1279079jax.95.1591211839673;
 Wed, 03 Jun 2020 12:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
In-Reply-To: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Wed, 3 Jun 2020 14:17:08 -0500
Message-ID: <CAEkB2ET_gfNUAuoZHxiGWZX7d3CQaJYJJqS2Fspif5mFq4-xfA@mail.gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

T24gV2VkLCBKdW4gMywgMjAyMCBhdCAxOjUyIFBNIE1hcmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxm
cmluZ0B3ZWIuZGU+IHdyb3RlOgo+Cj4gPiBDYWxsaW5nIHBtX3J1bnRpbWVfZ2V0X3N5bmMgaW5j
cmVtZW50cyB0aGUgY291bnRlciBldmVuIGluIGNhc2Ugb2YKPiA+IGZhaWx1cmUsIGNhdXNpbmcg
aW5jb3JyZWN0IHJlZiBjb3VudC4gQ2FsbCBwbV9ydW50aW1lX3B1dCBpZgo+ID4gcG1fcnVudGlt
ZV9nZXRfc3luYyBmYWlscy4KPgo+IElzIGl0IGFwcHJvcHJpYXRlIHRvIGNvcHkgYSBzZW50ZW5j
ZSBmcm9tIHRoZSBjaGFuZ2UgZGVzY3JpcHRpb24KPiBpbnRvIHRoZSBwYXRjaCBzdWJqZWN0Pwo+
Cj4gSG93IGRvIHlvdSB0aGluayBhYm91dCBhIHdvcmRpbmcgdmFyaWFudCBsaWtlIHRoZSBmb2xs
b3dpbmc/ClBsZWFzZSBzdG9wIHByb3Bvc2luZyByZXdvcmRpbmcgb24gbXkgcGF0Y2hlcyEKCkkg
d2lsbCBjb25zaWRlciB1cGRhdGluZyBteSBwYXRjaGVzIG9ubHkgaWYgYSBtYWludGFpbmVyIGFz
a3MgZm9yIGl0LgoKPgo+ICAgIFRoZSBQTSBydW50aW1lIHJlZmVyZW5jZSBjb3VudGVyIGlzIGdl
bmVyYWxseSBpbmNyZW1lbnRlZCBieSBhIGNhbGwgb2YKPiAgICB0aGUgZnVuY3Rpb24g4oCccG1f
cnVudGltZV9nZXRfc3luY+KAnS4KPiAgICBUaHVzIGNhbGwgdGhlIGZ1bmN0aW9uIOKAnHBtX3J1
bnRpbWVfcHV04oCdIGFsc28gaW4gdHdvIGVycm9yIGNhc2VzCj4gICAgdG8ga2VlcCB0aGUgcmVm
ZXJlbmNlIGNvdW50aW5nIGNvbnNpc3RlbnQuCj4KPgo+IFdvdWxkIHlvdSBsaWtlIHRvIGFkZCB0
aGUgdGFnIOKAnEZpeGVz4oCdIHRvIHRoZSBjb21taXQgbWVzc2FnZT8KPgo+IFJlZ2FyZHMsCj4g
TWFya3VzCgoKCi0tIApOYXZpZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

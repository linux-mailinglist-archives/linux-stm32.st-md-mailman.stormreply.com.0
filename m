Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328E1EDCB9
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jun 2020 07:43:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49BACC36B21;
	Thu,  4 Jun 2020 05:43:39 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5B96C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 05:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1591249403;
 bh=3MkFD5u516RHMXs9tkq7u9K3YawNQbXNaeFLtPqnKtQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=I3ELH3x/3D6qSmpDrl6cD8y2KG2tp5tbMj+Qfv9YpzGMIIwVe972QmH57+VgAQkYh
 bSCsyUCtVOO20dU4qAnDsGWf8YOojtRy7uyVToqZY814GDfKw/j5Yupune1uBzydMm
 mKUa10L1rXvME15InwNqd8ht3s2Kue7pi/iIvULA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.94.220]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mhnw2-1j307X1kG0-00drys; Thu, 04
 Jun 2020 07:43:23 +0200
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Navid Emamdoost <navid.emamdoost@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
 <CAMuHMdU3wMT_pnh4NE9W9Su6qip_oObgd6OiRCwfuvouqjXKHA@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <3eca8df2-22ae-06e0-5809-c11e459915d5@web.de>
Date: Thu, 4 Jun 2020 07:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU3wMT_pnh4NE9W9Su6qip_oObgd6OiRCwfuvouqjXKHA@mail.gmail.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:KynnLDi6KBJoEMNje4oN1eTT3NNOBiFU90Q69446fFG5stNUo72
 FmPpM60Wdq/d742po5l185fsNTdEDnhKVsx7aalLxglMhzAV90r4HJIuNIXyDynopO8z3cO
 rSQX0gMpluWTpgfluIkxagVEvTHi5/jehR6PUJ27joHQ+P/nnEHIVLBgzdLIdNjGirWpTop
 L+EIi5rZtfUcE6YQgH6lA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:qeH4pHbZvq8=:jmti1En2s8gckqqZeTZkwb
 S2shioru5R/hBxKDoGZEIcnMw/SwoBEyEPX059DjUeanDvCc7Fac9WiLMWPBD8AJQUSPGuKCk
 CDDxPa8qm2v90HBzoLF92WP64GNbts+YMlr8bjCcCdh695FEjG1lIiVC3sRvPiWn0+Du931ui
 Fc93bAeZ1RJKoEa+eXUzqCihuCA2Qz5ztiEE33lsfWcp7K+yQqeSxf7VlIlfOkLJTeRuzQwW8
 OStLEkZ9W5WOYscIZs8ETeG4nO9ydJWWU1btmxy4Ec7tZ4VPSAQMg2sFUET7c7ET0TgDZq7xf
 I0eZTkLk5qMx8LBtCHqZpK+1pTBEJQ/rqdhncwjgpdN95tCJMYGg+ShhPZbHtIe2V7c8Suka6
 Dm9jvBe8SPEhv3eI3JLAFf6jdnk5KcWsNzfPGqVKaar+/u9j1Y6JYyQ5bbJNxP6IcUpdWwnZ9
 cTG7tXpX4GjH5ZTGzHbLt4Qv7ZWRxT4y9OEeqiaDBXGLMMU+Q0JUxv+4WaVg1NDHX0zl3MTtn
 RLeV8vsBuIoaqOyowaC0eRaDtK87AbVtNxMl3JUZDzSVRB2CrK44HXXaufPqxYNmBspRqRRIH
 E9PzeatfbiLycom1n9IsyDLiTtDoIB5aX+OmRtwlCoN5HgfVKQL8qYDJ+fVcJI8kmaKRzI+Re
 Bx336G8dL+2iEjO7QoK5OtoEpmP9raxiivSBRUjTlDG7bfjs9G8QcMOWWApTMU8JoXtC2ItFi
 RcdPdFbO8Ire1AXb5qsh9qkouwcYqNv5s0Nz0B/71LCAsOP2vHlo9HYEtrwtNWNmvwhU1jNf8
 vm+Q/EEBUHuNZ8FIZhFM0+fyve7dLAoCyTyWvMgSd3C7LoeEsd28BlF+H+ubwTlzuQ7sv6x1D
 cFUF/gaF/PqL13J78WEXIu/OzIHvEhkXZqCT5gksVHT2c9d+qKgwXXwSt4NQMqj1rPavqqEMG
 yCHyi4RAyQ0ODjosyaRSavc60sRq95c5pmzfrEKKIP6pJ7uMFZsY7dolAPSF2b/M9K9zd2+I7
 UgzRX06sH1ZCiGQBTju0A4P04qVZjnnZyF1R9B/eE45meR+AgcQQb3c94sKFLloRj7MW+ac6Y
 /Q10piqqruZ/1Z7ae91DnKbn7gGsUnqQl+vC1yj2Gh1uvQFeNUXKA9zOYH3xPpA+8EHBi/c/8
 jinOPQC/S4lk4yUyY20RCgt3WNwTDlc+RAwzuBVvezI38NmgmZ1I+iE2zC0969K48rC+WTY04
 0PvWapH4m8KRnD3AY
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [Linux-stm32] dmaengine: stm32-mdma: call pm_runtime_put if
 pm_runtime_get_sync fails
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

Pj4+IENhbGxpbmcgcG1fcnVudGltZV9nZXRfc3luYyBpbmNyZW1lbnRzIHRoZSBjb3VudGVyIGV2
ZW4gaW4gY2FzZSBvZgo+Pj4gZmFpbHVyZSwgY2F1c2luZyBpbmNvcnJlY3QgcmVmIGNvdW50LiBD
YWxsIHBtX3J1bnRpbWVfcHV0IGlmCj4+PiBwbV9ydW50aW1lX2dldF9zeW5jIGZhaWxzLgo+Pgo+
PiBJcyBpdCBhcHByb3ByaWF0ZSB0byBjb3B5IGEgc2VudGVuY2UgZnJvbSB0aGUgY2hhbmdlIGRl
c2NyaXB0aW9uCj4+IGludG8gdGhlIHBhdGNoIHN1YmplY3Q/Cj4+Cj4+IEhvdyBkbyB5b3UgdGhp
bmsgYWJvdXQgYSB3b3JkaW5nIHZhcmlhbnQgbGlrZSB0aGUgZm9sbG93aW5nPwo+Pgo+PiAgICBU
aGUgUE0gcnVudGltZSByZWZlcmVuY2UgY291bnRlciBpcyBnZW5lcmFsbHkgaW5jcmVtZW50ZWQg
YnkgYSBjYWxsIG9mCj4+ICAgIHRoZSBmdW5jdGlvbiDigJxwbV9ydW50aW1lX2dldF9zeW5j4oCd
Lgo+PiAgICBUaHVzIGNhbGwgdGhlIGZ1bmN0aW9uIOKAnHBtX3J1bnRpbWVfcHV04oCdIGFsc28g
aW4gdHdvIGVycm9yIGNhc2VzCj4+ICAgIHRvIGtlZXAgdGhlIHJlZmVyZW5jZSBjb3VudGluZyBj
b25zaXN0ZW50Lgo+Cj4gSU1ITyB0aGUgaW1wb3J0YW50IHBhcnQgaXMgImV2ZW4gaW4gY2FzZSBv
ZiBmYWlsdXJlIiwgd2hpY2ggeW91IGRyb3BwZWQuCj4gTWlzc2luZyB0aGF0IHBvaW50IHdhcyB0
aGUgcm9vdCBjYXVzZSBvZiB0aGUgaXNzdWUgYmVpbmcgZml4ZWQuCj4gSGVuY2UgSSBwcmVmZXIg
dGhlIG9yaWdpbmFsIGRlc2NyaXB0aW9uLCBGV0lXLgoKV291bGQgeW91IGxpa2UgdG8gY29tbWVu
dCBhbnkgbW9yZSBvZiB0aGUgcHJlc2VudGVkIHBhdGNoIHJldmlldyBjb25jZXJucz8KCkNhbiBp
dCBtYWtlIHNlbnNlIHRvIGNvbWJpbmUgYW55IGFkanVzdG1lbnRzIGludG8gYSBzaW5nbGUgcGF0
Y2gKYWNjb3JkaW5nIHRvIHRoZSBkaXNjdXNzZWQgc29mdHdhcmUgdHJhbnNmb3JtYXRpb24gcGF0
dGVybj8KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3Byb2plY3QvbGttbC9saXN0
Lz9zdWJtaXR0ZXI9MjY1NDQmc3RhdGU9KiZxPWVuZ2luZSUzQStzdG0zMiZhcmNoaXZlPWJvdGgK
ClJlZ2FyZHMsCk1hcmt1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

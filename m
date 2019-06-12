Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D90B442102
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 11:37:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87BA5D2F1E9
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jun 2019 09:37:10 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9206D2F1E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 09:37:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m3so16149881wrv.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jun 2019 02:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=rOWtd7XOxe0FfSSEZRoiEo8adVKTNm/zc2wOuo36asU=;
 b=Ct/SEARzF2+ihR9jeLoP/sUqewPGY1VAk2sVOGCDCflsgPDum9PbqyFqPueg2EfxdA
 AOdmBknh2WvjLg3viMh0T32Sk2L9u4XAWuVUXlavuGZLVEWJprCOENyQyAeCcK89DaBR
 xrJ8VYN/50NJueoUU8qDhYPd0leaxmuRaN7vDLDxOfDmJfd2Z0LMrA+KTkWqZQwUy0qZ
 sctlxh0mJcceB5FKIkf65qv4nNoIIjTGQHeqdN48gicR5TfExYbwMlTN4lx4/JAnlQiD
 2BtK3/cZdn2zWXcMDdth0j4f2dD+OOj7zGgFB+zlyAI2QZpYzwriLEWaXnaN6pGlc8T4
 6MWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=rOWtd7XOxe0FfSSEZRoiEo8adVKTNm/zc2wOuo36asU=;
 b=CA68URQzsxtpcnyYnHJBTQvbCNfAycNKv8qHIHSJMcRd1d/l3/EZDWqwA8rSngyRhh
 bcd1oRSWzzBciNwZg78tvjgH+sJxDx3Tmy3RpMwyZdHJRnri9u6t/Xy60Ijmwm6Sueib
 alND2sua1YdK6Sgiog9SmZLBXKTStF051ZgX4CUxkRlp2RfRnbeLVKi91xekxzQC8K/S
 QHXiHtOacELiD/LrnTcaFNH1c08F9wfzfVBd1LldiKfl+xNMOlPB8z+bxHRmDfG22CNi
 F3OjKL9OCk1mTxvAXxAuzybtcLyegf5mGypynuCvvSXhdl5G9S/CQecQ/U1iU1wLdiU8
 vNuQ==
X-Gm-Message-State: APjAAAVz7Cyjb4OQr9cJGEXjCz1sPzBV+oU8NU9Sp92an+71hX29bdCo
 fZvRMCY8v8w4c2vvxAl2mSQI6g==
X-Google-Smtp-Source: APXvYqzCVj0vpoau0f+SroJHtqv1GmqnMQbxGBrbWEt+qIBocJp0pFlYG8Hlpfw9Ms/hqdYTwSZrtA==
X-Received: by 2002:a05:6000:110:: with SMTP id
 o16mr51576111wrx.200.1560332228225; 
 Wed, 12 Jun 2019 02:37:08 -0700 (PDT)
Received: from dell ([185.80.132.160])
 by smtp.gmail.com with ESMTPSA id t15sm8126623wrx.84.2019.06.12.02.37.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Jun 2019 02:37:07 -0700 (PDT)
Date: Wed, 12 Jun 2019 10:37:06 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20190612093706.GF4797@dell>
References: <ccefbd0b-3397-a26e-95e7-059fcced9154@st.com>
 <20190606124127.GA17082@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606124127.GA17082@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Amelie DELAUNAY <amelie.delaunay@st.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] mfd: stmfx: Uninitialized variable in
 stmfx_irq_handler()
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

T24gVGh1LCAwNiBKdW4gMjAxOSwgRGFuIENhcnBlbnRlciB3cm90ZToKCj4gVGhlIHByb2JsZW0g
aXMgdGhhdCBvbiA2NGJpdCBzeXN0ZW1zIHRoZW4gd2UgZG9uJ3QgY2xlYXIgdGhlIGhpZ2hlcgo+
IGJpdHMgb2YgdGhlICJwZW5kaW5nIiB2YXJpYWJsZS4gIFNvIHdoZW4gd2UgZG86Cj4gCj4gICAg
ICAgICBhY2sgPSBwZW5kaW5nICYgfkJJVChTVE1GWF9SRUdfSVJRX1NSQ19FTl9HUElPKTsKPiAg
ICAgICAgIGlmIChhY2spIHsKPiAKPiB0aGUgaWYgKGFjaykgY29uZGl0aW9uIHJlbGllcyBvbiB1
bmluaXRpYWxpemVkIGRhdGEuICBUaGUgZml4IGl0IHRoYXQKPiBJJ3ZlIGNoYW5nZWQgInBlbmRp
bmciIGZyb20gYW4gdW5zaWduZWQgbG9uZyB0byBhIHUzMi4gIEkgY2hhbmdlZCAibiIgYXMKPiB3
ZWxsLCBiZWNhdXNlIHRoYXQncyBhIG51bWJlciBpbiB0aGUgMC0xMCByYW5nZSBhbmQgaXQgZml0
cyBlYXNpbHkKPiBpbnNpZGUgYW4gaW50LiAgV2UgZG8gbmVlZCB0byBhZGQgYSBjYXN0IHRvICJw
ZW5kaW5nIiB3aGVuIHdlIHVzZSBpdCBpbgo+IHRoZSBmb3JfZWFjaF9zZXRfYml0KCkgbG9vcCwg
YnV0IHRoYXQgZG9lc24ndCBjYXVzZSBhIHByb2JsZSwgaXQncwo+IGZpbmUuCj4gCj4gRml4ZXM6
IDA2MjUyYWRlOTE1NiAoIm1mZDogQWRkIFNUIE11bHRpLUZ1bmN0aW9uIGVYcGFuZGVyIChTVE1G
WCkgY29yZSBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAb3JhY2xlLmNvbT4KPiAtLS0KPiB2Mjogd2hpdGUgc3BhY2UgY2hhbmdlcwo+IAo+ICBk
cml2ZXJzL21mZC9zdG1meC5jIHwgMTAgKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKQXBwbGllZCwgdGhhbmtzLgoKLS0gCkxlZSBK
b25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9y
ZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZh
Y2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

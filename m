Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 879902B18C3
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Nov 2020 11:09:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39CCBC56611;
	Fri, 13 Nov 2020 10:09:25 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B7A1C0692F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Nov 2020 10:09:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p8so9149302wrx.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Nov 2020 02:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OETRCzwRxEH0WVz90jhYLPds2AFkgQsQG0z89o37SRA=;
 b=YWgnbQASlUTQjWNWTmFgr8RiYMx/W4+rBQTcKwzjJeFb3i0rLJQ6tv+YQJ+HAsBeyr
 xG5K8fMPqyXcxDguJ6OKoAjzAIZkobWOF+m/QUU2mKjf6poODacFoHyGXKLAqUku6tKd
 KX0goflE1QSOKF1FIwTllrnF1dn/oXlC9iQEy8jDLrie8dnfgOmA0+Sz7ruEhNWwXNvb
 D3lNMjMZTJLUwnMAQiVVqFtKwQzTtj6W5SwsLykBeNMVglhegCmAkFoue1YF4PXIcm8q
 X2s2G/CzbdXWlZcxoME56Q5jVm5oTOUrbfvSxEQB05Xc7fUuHtwpN74NkZg+1e8OVCHu
 zMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OETRCzwRxEH0WVz90jhYLPds2AFkgQsQG0z89o37SRA=;
 b=lZbV3O/EiPl2CQ+hGxBr0ogXBHfLoNQELzTPLVFbzPbejdsqFx1IvT9gV9qVknqeph
 gSj+RHlPABpVJPo+etJ0sZDes8I3z+WaAZ15TBT3pekGBqAABVh92nTSp8DgqdlAY+FY
 XSDMUInS2v0iM5924QSgdf6zHHOEgmmwq+GJrlb9BFBzt5XX0yjJepeUOyCo8Dt7PXU2
 O7Rgk68KwI4rF1NWqcfp2MVN1O0JD4Nc8jQP196OSjrvxifJLpckzourD2TFz5HcABEI
 nZnvCbjoiaC458WoeIKqEgyPy5/EwICA8YaBeRxK67govJ4KF3L99CuZ0DNUCAc/Im81
 RsKg==
X-Gm-Message-State: AOAM531XKJYgeZrqraYLYZXZQpr28TDvRzbpqk5F1qxs62HTkN+vF90s
 /6IUSSuRDJeZ4BPFZORhJuIV7w==
X-Google-Smtp-Source: ABdhPJzpiNtAsMRhnqL5zdvoHbBm++WPqoCYlSzfGBr8Be3NDq3tGFfNkdYAW1qy6eaU3D3OAB2JEQ==
X-Received: by 2002:adf:ffc2:: with SMTP id x2mr2395767wrs.129.1605262162695; 
 Fri, 13 Nov 2020 02:09:22 -0800 (PST)
Received: from dell ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id s9sm11848119wrf.90.2020.11.13.02.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 02:09:21 -0800 (PST)
Date: Fri, 13 Nov 2020 10:09:19 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20201113100919.GC3718728@dell>
References: <20201110080400.7207-1-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110080400.7207-1-amelie.delaunay@st.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] mfd: stmfx: fix dev_err_probe call in
	stmfx_chip_init
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

T24gVHVlLCAxMCBOb3YgMjAyMCwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiByZXQgbWF5IGJl
IDAgc28sIGRldl9lcnJfcHJvYmUgc2hvdWxkIGJlIGNhbGxlZCBvbmx5IHdoZW4gcmV0IGlzIGFu
IGVycm9yCj4gY29kZS4KPiAKPiBGaXhlczogNDFjOWMwNmM0OTFhICgibWZkOiBzdG1meDogU2lt
cGxpZnkgd2l0aCBkZXZfZXJyX3Byb2JlKCkiKQo+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxh
dW5heSA8YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvc3RtZngu
YyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvc3RtZnguYyBiL2RyaXZlcnMvbWZk
L3N0bWZ4LmMKPiBpbmRleCA1ZTY4MGJmZGY1YzkuLjM2MGZiNDY0NjY4OCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL21mZC9zdG1meC5jCj4gKysrIGIvZHJpdmVycy9tZmQvc3RtZnguYwo+IEBAIC0z
MjksMTIgKzMyOSwxMSBAQCBzdGF0aWMgaW50IHN0bWZ4X2NoaXBfaW5pdChzdHJ1Y3QgaTJjX2Ns
aWVudCAqY2xpZW50KQo+ICAKPiAgCXN0bWZ4LT52ZGQgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfb3B0
aW9uYWwoJmNsaWVudC0+ZGV2LCAidmRkIik7Cj4gIAlyZXQgPSBQVFJfRVJSX09SX1pFUk8oc3Rt
ZngtPnZkZCk7Cj4gLQlpZiAocmV0ID09IC1FTk9ERVYpIHsKPiArCWlmIChyZXQgPT0gLUVOT0RF
VikKPiAgCQlzdG1meC0+dmRkID0gTlVMTDsKPiAtCX0gZWxzZSB7Cj4gKwllbHNlIGlmIChyZXQp
Cj4gIAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJmNsaWVudC0+ZGV2LCByZXQsCj4gIAkJCQkgICAg
ICJGYWlsZWQgdG8gZ2V0IFZERCByZWd1bGF0b3JcbiIpOwo+IC0JfQoKUHJvYmFibHkgbmljZXIg
dG8ga2VlcCBhbGwgb2YgdGhlIGVycm9yIGhhbmRpbmcgaW4gb25lIGFyZWEsIGxpa2U6CgoJaWYg
KHJldCkgewoJCWlmIChyZXQgPT0gLUVOT0RFVikKCQkJc3RtZngtPnZkZCA9IE5VTEw7CgkJZWxz
ZQoJCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmY2xpZW50LT5kZXYsIHJldCwKCQkJCQkgICAgICJG
YWlsZWQgdG8gZ2V0IFZERCByZWd1bGF0b3JcbiIpOwoJfQoKSSdsbCBsZXQgeW91IG1ha2UgdGhl
IGNhbGwgdGhvdWdoLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2Fs
IExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJs
b2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK

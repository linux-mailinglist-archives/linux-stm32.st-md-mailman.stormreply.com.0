Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 293781E1C3C
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2020 09:27:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2A51C36B23;
	Tue, 26 May 2020 07:27:12 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B9F7C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 07:27:10 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r15so1951942wmh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 00:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oX55DFCRlmwUFoRiiZXdIvxn1mRyrzPHH9QEEJ6CBmY=;
 b=Kc3UNpgCAQCZwq59P+VNL4aP6xlmDJ4FdAVbs8uqXEEBgNPCq2jjHYuGlkgm92U2OG
 89HbEnXOxA27+S97lV+X4TCgDXvI1yfSKHyPoKkZm7fIzgmz4rAtcHqnbC9b5SW3ZVXV
 G9BPXvYCLxv7MkeZdJpW/Rj8B3sNnCGsBMyvAuirbFCj1Smanz5e5D3s/6PupULXi0du
 f01uI7+NUqkmUFapg0KKOc0fcrMwK2xYYj5ixWR7VjGi70o1PXtkIGf3r9geNikqewOm
 +TnjHnVj+pz3WRmG0Z/HTPCzh+OPykxtbcUvEhw0VpfvEoN1x+l+g3iZBrpO/4AsdrQz
 cBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oX55DFCRlmwUFoRiiZXdIvxn1mRyrzPHH9QEEJ6CBmY=;
 b=USiNsHxF5CPZ4YjV4sfZkwaK6m5wKSf6g8PNz36EKfr68jgyY/WPfVoNXGmsQEPLoI
 GXh6s79ieBrWxfQIyPtdGQ7DLyq+gq6Gjrb48jRuit620hW1k2oudh4Fzirt1Goyy8UR
 7+wkLdU6nysZvlDr+3TASnOAI7KjpOuu5VGQCO76siCkSqAns0Ws7NoVhjdmyYBsnsuj
 4S8Ubo8sL49/sM6c2hQp98PC/DOZGNeZdbQthTmElq+Zz0h5WKZuwmkNuKHNXi5hhcAy
 O8C54u8W4qPrgoA9BAwuFbc+4EEU4cXLsJrTR+wNqO82sNFzJ+7gs/IDPyzN5ENzbchu
 i46Q==
X-Gm-Message-State: AOAM530+YG7AZh9oAatrnosBU7BzuNIPCASdJCOQ4Fa2dkwck1dueFck
 4RmmtgMbqXHM93ILRj4GteIpgA==
X-Google-Smtp-Source: ABdhPJzsqSQTVxDxq/52LQzAHWkQZWp3IEWvhukr2JFWOmsvjry6+PnvlzbFLZ6ileXrEqAAzFlW7g==
X-Received: by 2002:a7b:c207:: with SMTP id x7mr47969wmi.79.1590478030278;
 Tue, 26 May 2020 00:27:10 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id x10sm21466135wrn.54.2020.05.26.00.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 00:27:09 -0700 (PDT)
Date: Tue, 26 May 2020 08:27:08 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <20200526072708.GD3628@dell>
References: <20200422090833.9743-1-amelie.delaunay@st.com>
 <f5b3df45-a01a-7cb6-c158-e6edc0117f0f@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5b3df45-a01a-7cb6-c158-e6edc0117f0f@st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/3] STMFX power related fixes
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

T24gTW9uLCAyNSBNYXkgMjAyMCwgQW1lbGllIERFTEFVTkFZIHdyb3RlOgoKPiBIaSwKPiAKPiBH
ZW50bGUgcmVtaW5kZXIgcmVnYXJkaW5nIHRoaXMgc2VyaWVzIHNlbnQgb25lIG1vbnRoIGFnby4K
CkFwb2xvZ2llcyBBbWVsaWUsIHRoaXMgZmVsbCB0aHJvdWdoIHRoZSBnYXBzLgoKSWYgdGhpcyBo
YXBwZW5zIGluIHRoZSBmdXR1cmUganVzdCBzdWJtaXQgYSBbUkVTRU5EXS4KCkknbGwgdGFrZSBh
IGxvb2sgYXQgdGhpcywgdGhpcyB0aW1lIGhvd2V2ZXIuCgo+IE9uIDQvMjIvMjAgMTE6MDggQU0s
IEFtZWxpZSBEZWxhdW5heSB3cm90ZToKPiA+IFdpdGggc3VzcGVuZC9yZXN1bWUgdGVzdHMgb24g
U1RNMzJNUDE1N0MtRVYxIGJvYXJkLCBvbiB3aGljaCBTVE1GWCBpcyB1c2VkIGJ5Cj4gPiBzZXZl
cmFsIGRldmljZXMsIHNvbWUgZXJyb3JzIGNvdWxkIG9jY3VycmVkOiAtNiB3aGVuIHRyeWluZyB0
byByZXN0b3JlIFNUTUZYCj4gPiByZWdpc3RlcnMsIHNwdXJpb3VzIGludGVycnVwdHMgYWZ0ZXIg
ZGlzYWJsaW5nIHN1cHBseS4uLgo+ID4gVGhpcyBwYXRjaHNldCBmaXhlcyBhbGwgdGhlc2UgaXNz
dWVzIGFuZCBjbGVhbnMgSVJRIGluaXQgZXJyb3IgcGF0aC4KPiA+IAo+ID4gQW1lbGllIERlbGF1
bmF5ICgzKToKPiA+ICAgIG1mZDogc3RtZng6IHJlc2V0IGNoaXAgb24gcmVzdW1lIGFzIHN1cHBs
eSB3YXMgZGlzYWJsZWQKPiA+ICAgIG1mZDogc3RtZng6IGZpeCBzdG1meF9pcnFfaW5pdCBlcnJv
ciBwYXRoCj4gPiAgICBtZmQ6IHN0bWZ4OiBkaXNhYmxlIGlycSBpbiBzdXNwZW5kIHRvIGF2b2lk
IHNwdXJpb3VzIGludGVycnVwdAo+ID4gCj4gPiAgIGRyaXZlcnMvbWZkL3N0bWZ4LmMgICAgICAg
fCAyMiArKysrKysrKysrKysrKysrKysrKy0tCj4gPiAgIGluY2x1ZGUvbGludXgvbWZkL3N0bWZ4
LmggfCAgMSArCj4gPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+IAoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMg
VGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

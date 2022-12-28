Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE765BC92
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jan 2023 09:57:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 570B0C6A5E3;
	Tue,  3 Jan 2023 08:57:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C5D1C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Dec 2022 07:11:07 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id w1so2059271wrt.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Dec 2022 23:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BoevkCqm0C5XWODDQxiTKlCd9+LFUjRXCitTr69DptE=;
 b=uquiVL9NoYOszkI6bFc7kKQ24G0gAWYpSyGFNLCpco3sci1FSm+lJmoz9FHastz+7W
 U7kNSmACNWFQfonyKWbOpBg3Tfy7gkWkPTsSwzb1fpgPujs01WTbcl5S/0dkPz+xVYkb
 9CG+UoORXOA9XBJLngiNVW1EOh9PdQoh7Y6KJ1xz83uDoTSkFF3fW/T5yEIr6w94vLg5
 B3O6pAlokeHugK/VYHd+1c0vNzRyUn9dv4x6oq4xT6sx7Z6O7eecFAPZ1kTWxtrhdAHg
 BPbDQEP8vMH86Z9BtSOySt/qyvLIT+ybMSKwepuzQnqfkvjuDOMp59YQkW/au/AAHqO4
 7a/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BoevkCqm0C5XWODDQxiTKlCd9+LFUjRXCitTr69DptE=;
 b=qhJlvfu1T+sUOi/sZRAac5xgDMfpTyoNv+V9+x+Or3DRm0b4aA+7UJZ3mCsiSEHNXh
 QmbjZIbO+3IkAGnTzWnRYtNgGyIt2EJcUY9+rlIuGsdVT/z1G563w0fGhFjJOjIGhqHK
 +7NyspC+kSziOEE6KbtILjWImouKM98Wce2LNY/kDl9SwFWXUqxSy0ULgra0sJdXPY7P
 xjgCSP7NU9OHMFI0KVdJh13zO0xEi17k5l9TOkji/xFjs17cm6MYlkAaDvLdMrG3/1Vl
 SHEC7+1B4rHMoxxv/VVcz39WeaECONK59ebyKKm1OpR0QUUB41AkRmXE+/ALGfs+13ut
 5uNw==
X-Gm-Message-State: AFqh2kov82icEbctP9Eeyt27bgB00n8MVpp43JoNSyAkwVb8hQyj8Ez0
 VMzA3MAJpleUTP8kJs55ciFUQA==
X-Google-Smtp-Source: AMrXdXvbxe80HMxQjahLobDGkaTAMYMLKpxTJYeUbPE4yE/3SpjMedOXnc0L41IobhefT19PF0eBjg==
X-Received: by 2002:adf:d4c7:0:b0:25d:6628:debc with SMTP id
 w7-20020adfd4c7000000b0025d6628debcmr15680346wrk.10.1672211466922; 
 Tue, 27 Dec 2022 23:11:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d12-20020a5d4f8c000000b002421a8f4fa6sm14107330wru.92.2022.12.27.23.11.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Dec 2022 23:11:06 -0800 (PST)
Message-ID: <0acebf30-59a1-c336-1a44-19a74b4f244f@linaro.org>
Date: Wed, 28 Dec 2022 08:11:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
References: <20221005081317.3411684-1-arnaud.pouliquen@foss.st.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221005081317.3411684-1-arnaud.pouliquen@foss.st.com>
X-Mailman-Approved-At: Tue, 03 Jan 2023 08:57:47 +0000
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] remoteproc: virtio: Fix warning on
 bindings by removing the of_match_table
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

T24gNS8xMC8yMiAxMDoxMywgQXJuYXVkIFBvdWxpcXVlbiB3cm90ZToKPiBUaGUgY2hlY2twYXRj
aCB0b29sIGNvbXBsYWlucyB0aGF0ICJ2aXJ0aW8scnByb2MiIGlzIG5vdCBkb2N1bWVudGVkLgo+
IEJ1dCBpdCBpcyBub3QgcG9zc2libGUgdG8gcHJvYmUgdGhlIGRldmljZSAicnByb2MtdmlydGlv
IiBieSBkZWNsYXJpbmcKPiBpdCBpbiB0aGUgZGV2aWNlIHRyZWUuIFNvIGRvY3VtZW50aW5nIGl0
IGluIHRoZSBiaW5kaW5ncyBkb2VzIG5vdCBtYWtlCj4gc2Vuc2UuCgpQZXJoYXBzIHJld29yZGVk
IGEgYml0IGFzOgoKICAgIlNpbmNlIGl0IGlzIG5vdCBwb3NzaWJsZSB0byBwcm9iZSB0aGUgZGV2
aWNlICJycHJvYy12aXJ0aW8iIGJ5CiAgIGRlY2xhcmluZyBpdCBpbiB0aGUgZGV2aWNlIHRyZWUs
IGRvY3VtZW50aW5nIGl0IGluIHRoZSBiaW5kaW5ncwogICBkb2VzIG5vdCBtYWtlIHNlbnNlLiIK
Ck90aGVyd2lzZToKUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRA
bGluYXJvLm9yZz4KCj4gVGhpcyBjb21taXQgc29sdmVzIHRoZSBjaGVja3BhdGNoIHdhcm5pbmcg
Ynkgc3VwcHJlc3NpbmcgdGhlIHVzZWxlc3MKPiBvZl9tYXRjaF90YWJsZS4KPiAKPiBTdWdnZXN0
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gRml4ZXM6IDFkN2I2MWMwNmRj
MyAoInJlbW90ZXByb2M6IHZpcnRpbzogQ3JlYXRlIHBsYXRmb3JtIGRldmljZSBmb3IgdGhlIHJl
bW90ZXByb2NfdmlydGlvIikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5hdWQgUG91bGlxdWVuIDxh
cm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgo+IAo+IC0tLQo+IFVwZGF0ZXMgdnMgcHJldmlvdXMgcmV2aXNpb246
Cj4gLSByZXBsYWNlIHRoZSAib2ZfcGxhdGZvcm0uaCIgaW5jbHVkZSBieSAicGxhdGZvcm1fZGV2
aWNlLmgiLAo+IC0gcmVwbGFjZSAiRml4LXN1Z2dlc3RlZC1ieSIgYnkgIlN1Z2dlc3RlZC1ieSIs
Cj4gLSBhZGQgUm9iJ3MgUmV2aWV3ZWQtYnkuCj4gLS0tCj4gICBkcml2ZXJzL3JlbW90ZXByb2Mv
cmVtb3RlcHJvY192aXJ0aW8uYyB8IDggKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1179664799
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Jan 2023 18:43:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0D9AC6904A;
	Tue, 10 Jan 2023 17:43:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 15895C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673372612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8Y3pexWhwKnwismKyLBmb21oGlkflU/IM7CX+KUhW8=;
 b=fCGWs4TkihaYAz6s7sy0sRVR3UmOPqbz3yOVoLVIv/u6Ne6o/QZimkpRPoWw9ubkooDDSU
 X9lA8mDNkL2o93I9ukjKcLhkiBR3bZmJxKdsIcEtKlh/HR7YxgNshBFy3cLsdo58qWe2en
 lrB5zWJojxfkTlonfkOdZcjso1Y2Mmg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-GBhp4Oi2NzqHrwh2GQfBkg-1; Tue, 10 Jan 2023 12:43:31 -0500
X-MC-Unique: GBhp4Oi2NzqHrwh2GQfBkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi11-20020a05600c3d8b00b003d9ebf905c9so3981372wmb.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Jan 2023 09:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c8Y3pexWhwKnwismKyLBmb21oGlkflU/IM7CX+KUhW8=;
 b=ZOYPt9eKWn1aQCq1e0H1jBNyTkk/A+sKWTYlvHS0uO701ZJu/aXo89xxg3Cw4FHGzW
 VVYun0qAnikQnBc7o/FZJdd6k2e1L1QUVzWX2TMupXQhLoCARB9Qwlu2f/rl+YkmtMc9
 Wg35f0o55vYQfpgXpd7B6kUj1Nm8oGJ7/hAU/vAV7A1Se+/f6MD5s5OrLVzkrvow3G7p
 d/mPIFfok0EErdZnShQiRbb788mVMFcH45AS4JMXx651wWOYRSkmLFaqs/W998AMQgVA
 SdsQd0NuNmOI6NNBWZo6Lp8m/OghTOCcjxFjadzfEgH9LP4+dhwol1Hf1NtT0Che2Iqf
 781A==
X-Gm-Message-State: AFqh2krqhvyEQGtCrgv1VP5lpoI1a7bvGGLtPxAcA3i4Hbp3/n16zXHJ
 fTJ4VPmNX3JckLkvWgCLYvbhwn8QxgSDGuE8ZH+PUMs9RARCGIxlinYi0Cd1fkkDJSx3YS/GdbV
 Un3isasK/+GBCgxLx8xuH2OYRtULGOWxbB9/ZR5YY
X-Received: by 2002:a05:600c:3485:b0:3d1:ee6c:f897 with SMTP id
 a5-20020a05600c348500b003d1ee6cf897mr50288322wmq.3.1673372607714; 
 Tue, 10 Jan 2023 09:43:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvxU+5jK6DCKCFcOjrGESz1FsScmmigeVbnmUI9PNQjGsaat4nrYN0f6poWVOX7lRHhoUaFUg==
X-Received: by 2002:a05:600c:3485:b0:3d1:ee6c:f897 with SMTP id
 a5-20020a05600c348500b003d1ee6cf897mr50288302wmq.3.1673372607455; 
 Tue, 10 Jan 2023 09:43:27 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c10-20020a056000104a00b002238ea5750csm13837334wrx.72.2023.01.10.09.43.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 09:43:27 -0800 (PST)
Message-ID: <7a61ea5f-c6e0-1f6b-fc5c-40bdf2c6293e@redhat.com>
Date: Tue, 10 Jan 2023 18:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Arnd Bergmann <arnd@arndb.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
 <96e8a731-bf92-4cfd-b0be-dfbcb7a076c6@app.fastmail.com>
 <20221210092155.elcuvcbb4ukktxjp@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221210092155.elcuvcbb4ukktxjp@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-samsung-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm: Drop ARCH_MULTIPLATFORM from
	dependencies
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

T24gMTIvMTAvMjIgMTA6MjEsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEhlbGxvIEFybmQs
Cj4gCj4gT24gRnJpLCBEZWMgMDksIDIwMjIgYXQgMTE6NTM6NDlQTSArMDEwMCwgQXJuZCBCZXJn
bWFubiB3cm90ZToKPj4gT24gRnJpLCBEZWMgOSwgMjAyMiwgYXQgMjM6MDUsIFV3ZSBLbGVpbmUt
S8O2bmlnIHdyb3RlOgo+Pj4gU29tZSBvZiB0aGVzZSBkZXBlbmRlbmNpZXMgdXNlZCB0byBiZSBz
ZW5zaWJsZSB3aGVuIG9ubHkgYSBzbWFsbCBwYXJ0IG9mCj4+PiB0aGUgcGxhdGZvcm1zIHN1cHBv
cnRlZCBieSBBUkNIPWFybSBjb3VsZCBiZSBjb21waWxlZCB0b2dldGhlciBpbiBhCj4+PiBzaW5n
bGUga2VybmVsIGltYWdlLiBOb3dhZGF5cyBBUkNIX01VTFRJUExBVEZPUk0gaXMgb25seSB1c2Vk
IGFzIGEgZ3VhcmQKPj4+IGZvciBrZXJuZWwgb3B0aW9ucyBpbmNvbXBhdGlibGUgd2l0aCBhIG11
bHRpcGxhdGZvcm0gaW1hZ2UuIFNlZSBjb21taXQKPj4+IDg0ZmM4NjM2MDYyMyAoIkFSTTogbWFr
ZSBBUkNIX01VTFRJUExBVEZPUk0gdXNlci12aXNpYmxlIikgZm9yIHNvbWUgbW9yZQo+Pj4gZGV0
YWlscy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgo+Pgo+PiBNYWtlcyBzZW5zZSwKPj4KPj4gQWNrZWQtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gVGhhbmtzLiAoQnV0IGhvbmVzdGx5
IEknbSBub3Qgc3VycHJpc2VkIHlvdSBhZ3JlZSB0byB0aGlzIHBhdGNoIGFmdGVyCj4gb3VyIGNv
bnZlcnNhdGlvbiBvbiBpcmMgOi0pCj4KClRoaXMgbWFrZXMgc2Vuc2UgdG8gbWUgYXMgd2VsbCwg
YnV0IGl0IHdvdWxkIGJlIGdyZWF0IGlmIHNvbWVvbmUgZWxzZQpmcm9tIERSTSBjYW4gcmV2aWV3
L2FjayBiZWZvcmUgcHVzaGluZyBpdC4KClJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4KICAKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9LY29uZmlnIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9LY29u
ZmlnCj4+PiBpbmRleCA0NTVlMWE5MWYwZTUuLjc2ZGVkMTU2OGJkMCAxMDA2NDQKPj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL0tjb25maWcKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL0tjb25maWcKPj4+IEBAIC0yLDcgKzIsNyBAQAo+Pj4gIGNvbmZpZyBEUk1fT01B
UAo+Pj4gIAl0cmlzdGF0ZSAiT01BUCBEUk0iCj4+PiAgCWRlcGVuZHMgb24gRFJNICYmIE9GCj4+
PiAtCWRlcGVuZHMgb24gQVJDSF9PTUFQMlBMVVMgfHwgQVJDSF9NVUxUSVBMQVRGT1JNCj4+PiAr
CWRlcGVuZHMgb24gQVJDSF9PTUFQMlBMVVMKPj4+ICAJc2VsZWN0IERSTV9LTVNfSEVMUEVSCj4+
PiAgCXNlbGVjdCBWSURFT01PREVfSEVMUEVSUwo+Pj4gIAlzZWxlY3QgSERNSQo+Pgo+PiBTaW5j
ZSB0aGUgb3JpZ2luYWwgcHVycG9zZSBvZiB0aGUgfHxBUkNIX01VTFRJUExBVEZPUk0gd2FzIHRv
IGFsbG93Cj4+IGJ1aWxkaW5nIHRoZSBkcml2ZXIgb24gbW9yZSB0YXJnZXRzLCBJIHdvbmRlciBp
ZiB3ZSBzaG91bGQgaW5zdGVhZAo+PiBtYWtlIHRoYXQgfHxDT01QSUxFX1RFU1QsIHdoaWNoIHdv
dWxkIGFsc28gYWxsb3cgYnVpbGRpbmcgaXQgb24KPj4geDg2IGFuZCBvdGhlcnMuCj4gCj4gSSB3
b25kZXJlZCBhYm91dCB0aGF0LCB0b28sIGJ1dCB0aG91Z2h0IHRoYXQgd291bGQgYmUgYSBuZXcg
cGF0Y2guCj4KCkFncmVlZCB0aGF0IG1ha2luZyBpdCB8fCBDT01QSUxFX1RFU1Qgc2hvdWxkIGJl
IGluIGEgc2VwYXJhdGUgcGF0Y2guCgotLSAKQmVzdCByZWdhcmRzLAoKSmF2aWVyIE1hcnRpbmV6
IENhbmlsbGFzCkNvcmUgUGxhdGZvcm1zClJlZCBIYXQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==

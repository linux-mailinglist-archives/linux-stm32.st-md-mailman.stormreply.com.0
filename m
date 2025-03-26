Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE41AA71203
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 09:06:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4DD9C78F7F;
	Wed, 26 Mar 2025 08:06:36 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CA11C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 08:06:36 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso43454285e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 01:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742976395; x=1743581195;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7gqMtStm44sDN1iRrEG5qA3sdLqKE4ejLrbFQPQv/y0=;
 b=U8+CFJwXOW4DLjcrZ/3eADzTHpDVcqlbkDXRu2BKevnNk0Z0HPL89T7kbvsEqspPre
 ur4VbHtkzDBhcaglXQmYEkLWROUP5Yg5sj9VdKHmyFpEn3YlPzDjfFSbhPi+mQzxt5gN
 vhKSqPKUdFGbrt672Hgk+HDlcGVpp6bMQmsflTEYn/WXICmu8DWqXXFhDWRIf61v3S0O
 0WlC5WjRXHcygAWjSpWusEaaX8aJgnq7EkmQTc5+v55ZVxIpJm7qZSP/g1rNES+0RP4W
 ENeM5rFsKizypvV59HN5iKqnJFxTWsJwSb7aSstjPANsZOBDNnqx6I2I19yqNG8beQCR
 cBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742976395; x=1743581195;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7gqMtStm44sDN1iRrEG5qA3sdLqKE4ejLrbFQPQv/y0=;
 b=iDevG7uSoWO+ecry1cv2jGzTR/73cMLef22obyjaQhg66eFRXB2nuDurz5f/z5X8ig
 0oQww+vLt2g+2yaIM7Eotq9fi7sPFkKr8XLxrRVv8B5cGwH1YpOZIPfFqc8VaR+v1gef
 ztXFuLiGPFrlOqbfSAN3OmEZV7Z9/uXotsz+a6o2ci64+1+iJIkY8LBa6FOJPqOCq91k
 h/iR+Tg2eru2g3nOO+bR0SDkvi9YfV9+9JEF7VeY9WPT4lAByect8wz5GnQVCKPzPZ1z
 7VxxZoumUrpe1/JCANpWcR+Mos6ZLW8Wmdlu0ayAY34r+EzfXUxaTYDW2m7hBHhF30fD
 drLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDTJHY7MBC//d7fhOHetmmFZbJBN2jP3hsSGGX8rmJIbq4AHcdQK2nQp+V5heBYbv7Yo8NfzYmMhAMWQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxHFdDsytebfClJ84d/xuMFc7ioDcPN1hcChSqxzTTPLFZg4p+j
 bt6rU6KOKC6S7xayGgkg3bpzpv4x30SbPqGyTa62+cllKFHIDtzU3gSKXUxkLJc=
X-Gm-Gg: ASbGncuBc09pose53+stpbgm5VRCMRQW89vxYuFKbQAE9O9QG1eqjKYpxWmQ0AaAL1i
 lGVI6yB0+DlonUgZhJwPUBLAGHiz6bJaDL8/85nRnYDwO6xnKNuPC/lmKuKvIeXrn4kuyHookFe
 GGQiaZBWAUnvNsRo254P4uUWsmgzzXP2bZScROYUi40qYxdInJEZWPd3/QoOma5tIfFzZqf2vap
 teC1EoPHwVlEOP/jW78incgY4bx/FwVmoaXkfsi+euR3NCXxKjZAiplAv7/qfwtmVh+55Np04wT
 Yf5zNinS5x2IO+FxoiSKvO1UPvRnmk0a0eaZ7eWVf2faJxDYwcgOXzU8toSqhC/4fxDH/PWHhmO
 bcLWoTFfM
X-Google-Smtp-Source: AGHT+IGLoLRqgi6MSpyHe+/8p9iRPVFA3lPXpq3HIaDfSybdmPunM7GvMPFLrX3oQG6d+ZPluBW1Uw==
X-Received: by 2002:a05:600c:4e12:b0:43d:26e3:f2f6 with SMTP id
 5b1f17b1804b1-43d509e654fmr199464555e9.5.1742976395544; 
 Wed, 26 Mar 2025 01:06:35 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43d43fdeb79sm225846615e9.25.2025.03.26.01.06.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 01:06:35 -0700 (PDT)
Message-ID: <84ed89d5-91af-445b-96e6-2c1e41d65294@linaro.org>
Date: Wed, 26 Mar 2025 09:06:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, tglx@linutronix.de
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
 <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
 <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
 <098c5de8-9291-4f3e-a276-500825cac7c5@linaro.org>
 <068713cb-47ca-ae26-e113-9f5026be9196@oss.nxp.com>
 <cc2dd75c-e279-4e55-ab88-75498e93146a@linaro.org>
 <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
 <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
 <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Larisa Grigore <Larisa.Grigore@nxp.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Fossati <thomas.fossati@linaro.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/nxp-timer: Add
 the System Timer Module for the s32g platform
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

T24gMjYvMDMvMjAyNSAwODo0NCwgR2hlbm5hZGkgUHJvY29wY2l1YyB3cm90ZToKPiBPbiAzLzI1
LzIwMjUgMzo1NCBQTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+IE9uIDI1LzAzLzIwMjUgMTQ6
MjEsIEdoZW5uYWRpIFByb2NvcGNpdWMgd3JvdGU6Cj4+PiBPbiAzLzI1LzIwMjUgMjo1MSBQTSwg
RGFuaWVsIExlemNhbm8gd3JvdGU6CgpbIC4uLiBdCgo+Pj4+Pgo+Pj4+PiBUaGlzIHdvdWxkbid0
IGJlIHRoZSBjYXNlIGlmIHRoZSBTVE0gaXMga2VwdCBydW5uaW5nL2NvdW50aW5nIGR1cmluZwo+
Pj4+PiB0aGUKPj4+Pj4gY2xvY2sgZXZlbnQgc2V0dXAsIHdpdGggb25seSB0aGUgY2xvY2sgZXZl
bnQgaW50ZXJydXB0IGJlaW5nIGRpc2FibGVkCj4+Pj4+IChDQ1IuQ0VOKS4KPj4+Pgo+Pj4+IEFy
ZSB5b3UgYXNraW5nIHRvIHVzZSB0d28gZGlmZmVyZW50IGNoYW5uZWxzIGZvciB0aGUgc2FtZSBT
VE0gaW5zdGFuY2UsCj4+Pj4gb25lIGZvciB0aGUgY2xvY2tzb3VyY2UgYW5kIG9uZSBmb3IgdGhl
IGNsb2NrZXZlbnQgPwo+Pj4+Cj4+Pgo+Pj4gSSBzdWdnZXN0ZWQgdXNpbmcgdGhlIENOVCByZWdp
c3RlciB0byBvYnRhaW4gdGhlIGNvdW50IGZvciB0aGUgY2xvY2sKPj4+IHNvdXJjZSwgd2hpbGUg
dXNpbmcgb25lIG9mIHRoZSBTVE0gY2hhbm5lbHMgZm9yIHRoZSBjbG9jayBldmVudC4KPj4KPj4g
QWgsIG9rLgo+Pgo+PiBJIHRoaW5rIGl0IGlzIHByZWZlcmFibGUgdG8ga2VlcCB0aGVtIHNlcGFy
YXRlZCB0byBrZWVwIHRoZSBjb2RlCj4+IG1vZHVsYXIuIEdpdmVuIHRoZSBudW1iZXIgb2YgU1RN
IG9uIHRoZSBwbGF0Zm9ybSwgaXQgZG9lcyBub3QgaHVydAo+Pgo+IAo+IFRoZSBTMzJHMiBhbmQg
UzMyRzMgYXJlIFNvQ3MgZmVhdHVyaW5nIGEgZGl2ZXJzZSBzZXQgb2YgY29yZXMuIExpbnV4IGlz
Cj4gZXhwZWN0ZWQgdG8gcnVuIG9uIENvcnRleC1BNTMgY29yZXMsIHdoaWxlIG90aGVyIHNvZnR3
YXJlIHN0YWNrcyB3aWxsCj4gb3BlcmF0ZSBvbiBDb3J0ZXgtTSBjb3Jlcy4gVGhlIG51bWJlciBv
ZiBTVE0gaW5zdGFuY2VzIGhhcyBiZWVuIHNpemVkIHRvCj4gaW5jbHVkZSBhdCBtb3N0IG9uZSBp
bnN0YW5jZSBwZXIgY29yZS4gQWxsb2NhdGluZyBzaXggaW5zdGFuY2VzICgxIGNsb2NrCj4gc291
cmNlLCAxIGJyb2FkY2FzdCBjbG9jayBldmVudCwgYW5kIDQgY2xvY2sgZXZlbnRzIGZvciBhbGwg
QTUzIGNvcmVzKQo+IHRvIExpbnV4IG9uIHRoZSBTMzJHMiBsZWF2ZXMgdGhlIE03IHNvZnR3YXJl
IHN0YWNrcyB3aXRob3V0IGFkZXF1YXRlIFNUTQo+IGNvdmVyYWdlLgoKTW1oLCByaWdodC4gRnJv
bSB0aGlzIHBlcnNwZWN0aXZlIGl0IG1ha2VzIHNlbnNlLgoKPiBBZGRpdGlvbmFsbHksIHRoZSBw
cm9wb3NlZCBpbXBsZW1lbnRhdGlvbiB1c2VzIG9ubHkgb25lIFNUTSBjaGFubmVsIG91dAo+IG9m
IGZvdXIsIHdoaWNoIGlzIG5vdCBvcHRpbWFsIGhhcmR3YXJlIHVzYWdlLiBJIHN1Z2dlc3QgdXNp
bmcgYWxsIFNUTQo+IGNoYW5uZWxzIGluc3RlYWQgb2YgbGltaXRpbmcgaXQgdG8gYSBzaW5nbGUg
Y2hhbm5lbCBwZXIgaW5zdGFuY2UsIGdpdmVuCj4gdGhhdCB0aGUgZHJpdmVyIGFscmVhZHkgdXNl
cyBhIGdsb2JhbCBzdHJ1Y3R1cmUgdG8gcGFpciBTVE0gaW5zdGFuY2VzCj4gd2l0aCBjb3Jlcy4g
VGhpcyBhcHByb2FjaCB3aWxsIG9wdGltaXplIHRoZSBudW1iZXIgb2YgaW5zdGFuY2VzIHJlcXVp
cmVkCj4gYnkgTGludXggYW5kIGxldmVyYWdlIHRoZSBjYXBhYmlsaXRpZXMgb2YgZWFjaCBTVE0u
CgoKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZh
Y2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8j
IS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9n
Lz4gQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=

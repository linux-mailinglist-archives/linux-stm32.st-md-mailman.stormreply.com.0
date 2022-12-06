Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D51644A3B
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 18:21:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E43D2C65E6C;
	Tue,  6 Dec 2022 17:21:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D16F7C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 17:21:26 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso14815136wme.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 09:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cNN8uk4LoV+h49kv6LcOlJpfohjdevi0JmsE7e599PE=;
 b=cTJUk+i7XUeEhmp/IiPt+U7G958PLg8NVYNJm+mTfjmHh+It3e0iAwPYoDczFNrvWv
 lsN1Iu27FFWXZfjQeeu41m0zQxSz1WYLAxdU2mJ5dm8K12zMJT5NpWXlIqUj0+cxkn6I
 LlPwug0inqRWq0pEK7pTlDa8/gHUErKh6nIn8su1AwbaOaPON6m50pX9bLkRBufd3/zj
 gpZ2aNGfYG1Pxv1kFdOn97kRIhA643dFtsICI6p5G+PVXy+26GH2hrWG1JIgBTSvt1iW
 7yIvk2sStuyQzofcY+lXuY+2o0BMkErrNdkNuThw6BpbbMu8K+bD0Bll+qcHEv7d1/WA
 aVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cNN8uk4LoV+h49kv6LcOlJpfohjdevi0JmsE7e599PE=;
 b=DbSTQRrBiZZb7WxQkxWtu6A40khmSVPuEVjAC5qgPFdj4fSWl2Zn0cgoBUoX12kCuK
 KvWDktlHgGzDdGP14+h993U15obH+Z3k5b/N8u5bANQVTqbaPpDmBFFyt14ljzc8rLkg
 HOOsC1VyuwRkGkT08rH0zsbViDL4dL/2kJ/gUMfkQM3stJRW901qpeTBXBNDXYZ9fdfW
 B4Fds6L8BsgcFBN6tDtCBPDI7H79dhPrL7yifT/8xYTMOMF19aEsX0y1JdhN1G0Pi6QI
 fUwCd4pk8rf/YS4TZL7V4OaQcsxZ5ynfCP4ADuj8AVOk1zqK5a6YhG/cOnzVie5K0CVK
 UG3w==
X-Gm-Message-State: ANoB5pkDL0R8058qAXte0N/HRm1bzuTdEW1LpsHoxUDis5ppZ765r1Bd
 iH7AonhvznGee5P0i/JYnqjSdg==
X-Google-Smtp-Source: AA0mqf7gm2xCP89/QOg/3k2lG5ouNJyby9r2wGnCo7mXF+hzuscgwBcgIIwQMgLouN3ahqN1GmnpQA==
X-Received: by 2002:a05:600c:792:b0:3cf:6a83:bd19 with SMTP id
 z18-20020a05600c079200b003cf6a83bd19mr56719834wmo.29.1670347286328; 
 Tue, 06 Dec 2022 09:21:26 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
 by smtp.googlemail.com with ESMTPSA id
 d2-20020a5d4f82000000b002425dc49024sm7117374wru.43.2022.12.06.09.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 09:21:26 -0800 (PST)
Message-ID: <e0d9b932-79b3-47d6-529b-82b22639da3d@linaro.org>
Date: Tue, 6 Dec 2022 18:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: ye.xingchen@zte.com.cn, rafael@kernel.org
References: <202211171409524332954@zte.com.cn>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <202211171409524332954@zte.com.cn>
Cc: linux-kernel@vger.kernel.org, amitk@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] thermal: use
	devm_platform_get_and_ioremap_resource()
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

T24gMTcvMTEvMjAyMiAwNzowOSwgeWUueGluZ2NoZW5AenRlLmNvbS5jbiB3cm90ZToKPiBGcm9t
OiBNaW5naGFvIENoaSA8Y2hpLm1pbmdoYW9AenRlLmNvbS5jbj4KPiAKPiBDb252ZXJ0IHBsYXRm
b3JtX2dldF9yZXNvdXJjZSgpLCBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKSB0byBhIHNpbmdsZQo+
IGNhbGwgdG8gZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UoKSwgYXMgdGhp
cyBpcyBleGFjdGx5Cj4gd2hhdCB0aGlzIGZ1bmN0aW9uIGRvZXMuCj4gCj4gU2lnbmVkLW9mZi1i
eTogTWluZ2hhbyBDaGkgPGNoaS5taW5naGFvQHp0ZS5jb20uY24+Cj4gU2lnbmVkLW9mZi1ieTog
eWUgeGluZ2NoZW4gPHllLnhpbmdjaGVuQHp0ZS5jb20uY24+Cj4gLS0tCgpBcHBsaWVkLCB0aGFu
a3MKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFj
ZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMh
L2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cv
PiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=

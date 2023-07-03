Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B84E7455AF
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 08:58:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0E00C6B46C;
	Mon,  3 Jul 2023 06:58:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A8CCC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 03:21:36 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-3fbc1218262so48242695e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Jul 2023 20:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688354496; x=1690946496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=38M0FwP656/My/R316BO0zrI7Qa9x58e/irRx5f2stI=;
 b=dKgQBqUl6jIQfAHIRMPQ88ZlRQDNyJ1lZYrWHEqwlf9pqIlIqv9bf4Gm9ujpEPdLQW
 On6k374TuHVlO0bd8IoXVlyw8DqwENgfRC3ZRVLDLgApjA53pfiXncA/Q7UqvyzU8FNf
 odShTSq4mA5aPCWU6ml0qCdTwJSrtr92y4MxapZYUrgYaYb+dXoZUWReFFl93m+cfqFf
 /rBtqLkep7DHeBl9fdIzkSmmn8OpahTxYEr33yLLZ6fvubmM6Oq2QhMQM6lVpRBzcrPD
 zJv8fnNjhggU5303gYXdFuVTYBNw1qxHx6ghYi2TaKUtieXNi57JAsLNqiwmaHZXeafV
 se7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688354496; x=1690946496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=38M0FwP656/My/R316BO0zrI7Qa9x58e/irRx5f2stI=;
 b=EniwcYgwAEvsRoWViEXgww+vyqw1CJpmpY/gFEmsOpuRq9FeUJuLK1SVov2A1acbaB
 Fi2h4ZI2yAjlGgxfEvDRyf4Wpj4NN7WD8xtDo8iz6WhQShnKtslS+c9MLfYrUTKx/Rqi
 jMmYQOfaqAqvf15l+tAAmPpKlw/tRqrnH6Oz/jlqrmInnbfz0XKtOlTHYMUxnKzl29oE
 Ov4cXv7kXKNQsIVOtO/prbOZklgBVFSHiDXCo6PwIujxTRvYo5aa5mDSFg5Oo0zsWhmJ
 ZIMDvVGfpPwSLlOxrkOaLkS7+VFBMuxJ8SBIA+nk/6eGMB4vPOCdJe+jck9s2PJNziJC
 +QrA==
X-Gm-Message-State: AC+VfDxcEdnQrjfUhIFBHGQumgmw4zp4XIG8B22ln/xbNdSYijnB9CG8
 c5u+NhMUkxdEmyFyjGwraao=
X-Google-Smtp-Source: ACHHUZ7Rp72qUewfEccta263SQbouSqaHJYfVkSj2157P9f4cf5rg5iLSXNoTE09SJn5RzueTMVLcg==
X-Received: by 2002:a1c:f318:0:b0:3fb:b008:2003 with SMTP id
 q24-20020a1cf318000000b003fbb0082003mr8489306wmq.38.1688354495571; 
 Sun, 02 Jul 2023 20:21:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:32f:1f0:ae0b:3bc8:c743:b2d8?
 ([2a01:e0a:32f:1f0:ae0b:3bc8:c743:b2d8])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a1c6a04000000b003fba2734f1esm16756469wmc.1.2023.07.02.20.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Jul 2023 20:21:35 -0700 (PDT)
Message-ID: <4aba0e4a-87f0-1810-bf4d-a2f278e51e8b@gmail.com>
Date: Mon, 3 Jul 2023 05:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230702103516.139440-1-rgallaispou@gmail.com>
 <11ec64ad-8fb8-e94d-2019-d3deb399084b@linaro.org>
From: =?UTF-8?Q?Rapha=c3=abl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <11ec64ad-8fb8-e94d-2019-d3deb399084b@linaro.org>
X-Mailman-Approved-At: Mon, 03 Jul 2023 06:58:45 +0000
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: st: add buswidth property to
	stm32f429-disco
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

SGksCgpMZSAwMi8wNy8yMDIzIMOgIDIyOjE0LCBLcnp5c3p0b2YgS296bG93c2tpIGEgw6ljcml0
wqA6Cj4gT24gMDIvMDcvMjAyMyAxMjozNSwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4g
VGhlIGlsaTkzNDEgaXMgbGVmdCB3aXRob3V0IGEgbWFuZGF0b3J5IGJ1c3dpZHRoIHRvIHByb3Bl
cmx5IGNvbW11bmljYXRlCj4+IGJldHdlZW4gdGhlIFNJIGJ1cyBhbmQgdGhlIGRpc3BsYXkuIEFk
ZCB0aGUgZGV2aWNlLXRyZWUgcHJvcGVydHkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwg
R2FsbGFpcy1Qb3UgPHJnYWxsYWlzcG91QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJmNDI5LWRpc2NvLmR0cyB8IDEgKwo+IAo+IFRoZXJlIGlzIG5vIHN1Y2gg
ZmlsZS4gUGxlYXNlIHJlYmFzZSBvbiByZWNlbnQgTGludXguCgpZZXMsIGluZGVlZC4gSSBmb3Jn
b3QgdG8gcHVsbCwgSSdtIHNvcnJ5LgoKPiAKPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS1kaXNj
by5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjktZGlzY28uZHRzCj4+IGluZGV4IDNi
ODEyMjhkNDZhMi4uNWVhZjk1YWZjOGM3IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0
cy9zdG0zMmY0MjktZGlzY28uZHRzCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQy
OS1kaXNjby5kdHMKPj4gQEAgLTE5Nyw2ICsxOTcsNyBAQCBkaXNwbGF5OiBkaXNwbGF5QDF7Cj4+
ICAgCQlzcGktM3dpcmU7Cj4+ICAgCQlzcGktbWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMD47Cj4+
ICAgCQlkYy1ncGlvcyA9IDwmZ3Bpb2QgMTMgMD47Cj4+ICsJCWJ1c3dpZHRoID0gPDg+Owo+IAo+
IFRoZXJlIGlzIG5vIHN1Y2ggc3BpIHByb3BlcnR5LgoKV2hpbGUgSSBhZ3JlZSB3aXRoIHlvdSwg
SSBzYXcgaW4gc3RhZ2luZyBkcml2ZXJzIHRoYXQgdGhpcyBwcm9wZXJ0eSB3YXMgCmZldGNoIGlu
IHRoZSBkZXZpY2UtdHJlZSBieSB0aGUgZmJ0ZnQgY29yZS4KClNob3VsZCBJIGRvY3VtZW50IHRo
b3NlIGluIG9yIHRyeSB0byBkbyBpdCBhbm90aGVyIHdheSA/Cgo+IAo+IEJlc3QgcmVnYXJkcywK
PiBLcnp5c3p0b2YKPiAKClRoYW5rcywKUmFwaGHDq2wKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

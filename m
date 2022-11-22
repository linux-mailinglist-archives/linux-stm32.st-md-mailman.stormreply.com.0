Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBAA63421F
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Nov 2022 18:03:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E819C6504B;
	Tue, 22 Nov 2022 17:03:33 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CCBE0C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 17:03:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id t4so11165323wmj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Nov 2022 09:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6nhEEaoh/VcXJH4n5hY98SxMNK4kG9V8xGcvOhwOUOA=;
 b=ey4I+T4vbFBZcvd6BvzRMjTIz59KfQQfa6B849ysx9rZqbkcIR0s8BJyLfeTNOLRU3
 BtUfba4qm1vJvxtixgSLo+oATBWNkSFax+j6HO1vUpzovNblxSuZt/tkPnFSbr3t1Poz
 rl9xRtU6HA1nWn7Y54XMDxlund8gOrmAVmndv4BjnZswrzDavoAt/rIEPcOGwRWTIKCm
 s5OrgAmWjOFVyNYgI+RhdxN1x808VrVMX/1AfZ/M71khiA7og+TzRUz2r0M4oCe2maFY
 7OPuCVn9IeVAToljsMqDxgXvE8PypYjPcoLtysfpQhPS0Q+gr0hql5O96lGoVP0EXAap
 IgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6nhEEaoh/VcXJH4n5hY98SxMNK4kG9V8xGcvOhwOUOA=;
 b=hO6257/H5xri7c3GMhri/yX+kBO0n8bqg5uT6nM1NrqNh6kqwecl/DUlbl0+LAHcLr
 9U1tNKPwjAILdi2E7Px6cszU3T2tEJzbQPSRcFHezupwuTokpEhJXM3Rx/VOgvc+vDkY
 Eb6WIgXJONu6qznz1vdGb6PopKym18W8qIdHSuo9chgTlI5gHFgrIBcT2daAQTJ0Lxkx
 1MrdUALwE4fOTD+gmf/W2C/rwRZUzf7epxdwap4Ke4fujxh4ocJYgwR9V7pJ35M31d3X
 paAoGhcHgcWGySkuGS+l2MC5RrP/T35a5jQIdZ6GrLacrLI+kd1PyThRB/Ca8XynTeTj
 Ws9A==
X-Gm-Message-State: ANoB5pmDWVueU9knskF8j3080H74srPKNOGETbZRTcXLq+8Ife+a4arF
 hZnNnUs/dhT3etvl85ISVu0=
X-Google-Smtp-Source: AA0mqf5aTg8+S6uKEPj96utoXf8duBP36uWZVEQIF3e+FSkl7cFIK1CtvtjgkYxB8bZEzb9G39gmIA==
X-Received: by 2002:a1c:7513:0:b0:3cf:8896:e1c9 with SMTP id
 o19-20020a1c7513000000b003cf8896e1c9mr20286552wmc.119.1669136612325; 
 Tue, 22 Nov 2022 09:03:32 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
 by smtp.gmail.com with ESMTPSA id
 q3-20020adfcd83000000b0022eafed36ebsm14609696wrj.73.2022.11.22.09.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 09:03:31 -0800 (PST)
Message-ID: <992ba484-b1d3-4ea6-1904-78b0dd913380@gmail.com>
Date: Tue, 22 Nov 2022 18:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221122010753.3126828-1-bero@baylibre.com>
 <20221122010753.3126828-8-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221122010753.3126828-8-bero@baylibre.com>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v2 7/7] ARM: dts: stm32: Remove the
 pins-are-numbered property
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

CgpPbiAyMi8xMS8yMDIyIDAyOjA3LCBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIHdyb3RlOgo+IFJl
bW92ZSB0aGUgcGlucy1hcmUtbnVtYmVyZWQgcHJvcGVydHkgZnJvbSBTVE0zMiBEZXZpY2VUcmVl
cwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgPGJlcm9AYmF5bGli
cmUuY29tPgoKUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb20+Cgo+IC0tLQo+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2kg
fCAxIC0KPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjctcGluY3RybC5kdHNpIHwgMSAtCj4g
ICBhcmNoL2FybS9ib290L2R0cy9zdG0zMmg3NDMuZHRzaSAgICAgICB8IDEgLQo+ICAgYXJjaC9h
cm0vYm9vdC9kdHMvc3RtMzJtcDEzMS5kdHNpICAgICAgfCAxIC0KPiAgIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTEuZHRzaSAgICAgIHwgMiAtLQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCA2IGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0LXBp
bmN0cmwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQtcGluY3RybC5kdHNpCj4gaW5k
ZXggNTAwYmNjMzAyZDQyMi4uNDUyM2M2MzQ3NWU0YyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMmY0LXBpbmN0cmwuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMyZjQtcGluY3RybC5kdHNpCj4gQEAgLTUxLDcgKzUxLDYgQEAgcGluY3RybDogcGluY3RybEA0
MDAyMDAwMCB7Cj4gICAJCQlyYW5nZXMgPSA8MCAweDQwMDIwMDAwIDB4MzAwMD47Cj4gICAJCQlp
bnRlcnJ1cHQtcGFyZW50ID0gPCZleHRpPjsKPiAgIAkJCXN0LHN5c2NmZyA9IDwmc3lzY2ZnIDB4
OD47Cj4gLQkJCXBpbnMtYXJlLW51bWJlcmVkOwo+ICAgCj4gICAJCQlncGlvYTogZ3Bpb0A0MDAy
MDAwMCB7Cj4gICAJCQkJZ3Bpby1jb250cm9sbGVyOwo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjct
cGluY3RybC5kdHNpCj4gaW5kZXggOGYzN2FlZmE3MzE1MC4uYzhlNmM1MmZiMjQ4ZSAxMDA2NDQK
PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjctcGluY3RybC5kdHNpCj4gQEAgLTE1LDcgKzE1LDYgQEAg
cGluY3RybDogcGluY3RybEA0MDAyMDAwMCB7Cj4gICAJCQlyYW5nZXMgPSA8MCAweDQwMDIwMDAw
IDB4MzAwMD47Cj4gICAJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZleHRpPjsKPiAgIAkJCXN0LHN5
c2NmZyA9IDwmc3lzY2ZnIDB4OD47Cj4gLQkJCXBpbnMtYXJlLW51bWJlcmVkOwo+ICAgCj4gICAJ
CQlncGlvYTogZ3Bpb0A0MDAyMDAwMCB7Cj4gICAJCQkJZ3Bpby1jb250cm9sbGVyOwo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmg3NDMuZHRzaSBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMyaDc0My5kdHNpCj4gaW5kZXggMjhlM2RlYjIwZTFlMS4uZjMwNzk2ZjdhZGYzNiAx
MDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmg3NDMuZHRzaQo+ICsrKyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMyaDc0My5kdHNpCj4gQEAgLTU4OCw3ICs1ODgsNiBAQCBwaW5j
dHJsOiBwaW5jdHJsQDU4MDIwMDAwIHsKPiAgIAkJCXJhbmdlcyA9IDwwIDB4NTgwMjAwMDAgMHgz
MDAwPjsKPiAgIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+Owo+ICAgCQkJc3Qsc3lzY2Zn
ID0gPCZzeXNjZmcgMHg4PjsKPiAtCQkJcGlucy1hcmUtbnVtYmVyZWQ7Cj4gICAKPiAgIAkJCWdw
aW9hOiBncGlvQDU4MDIwMDAwIHsKPiAgIAkJCQlncGlvLWNvbnRyb2xsZXI7Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxMzEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxMzEuZHRzaQo+IGluZGV4IDJhOWIzYTViYmE4MzAuLmFkYWVlMGY5ZTEyNjMgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEzMS5kdHNpCj4gKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDEzMS5kdHNpCj4gQEAgLTU0OSw3ICs1NDksNiBAQCBwaW5j
dHJsOiBwaW5jdHJsQDUwMDAyMDAwIHsKPiAgIAkJCXJhbmdlcyA9IDwwIDB4NTAwMDIwMDAgMHg4
NDAwPjsKPiAgIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+Owo+ICAgCQkJc3Qsc3lzY2Zn
ID0gPCZleHRpIDB4NjAgMHhmZj47Cj4gLQkJCXBpbnMtYXJlLW51bWJlcmVkOwo+ICAgCj4gICAJ
CQlncGlvYTogZ3Bpb0A1MDAwMjAwMCB7Cj4gICAJCQkJZ3Bpby1jb250cm9sbGVyOwo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUxLmR0c2kgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTUxLmR0c2kKPiBpbmRleCA1NDkxYjZjNGRlYzIwLi40ZTQzN2QzZjJlZDY2
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaQo+ICsrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaQo+IEBAIC0xNjYwLDcgKzE2NjAsNiBA
QCBwaW5jdHJsOiBwaW5jdHJsQDUwMDAyMDAwIHsKPiAgIAkJCXJhbmdlcyA9IDwwIDB4NTAwMDIw
MDAgMHhhNDAwPjsKPiAgIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+Owo+ICAgCQkJc3Qs
c3lzY2ZnID0gPCZleHRpIDB4NjAgMHhmZj47Cj4gLQkJCXBpbnMtYXJlLW51bWJlcmVkOwo+ICAg
Cj4gICAJCQlncGlvYTogZ3Bpb0A1MDAwMjAwMCB7Cj4gICAJCQkJZ3Bpby1jb250cm9sbGVyOwo+
IEBAIC0xNzg5LDcgKzE3ODgsNiBAQCBwaW5jdHJsX3o6IHBpbmN0cmxANTQwMDQwMDAgewo+ICAg
CQkJI3NpemUtY2VsbHMgPSA8MT47Cj4gICAJCQljb21wYXRpYmxlID0gInN0LHN0bTMybXAxNTct
ei1waW5jdHJsIjsKPiAgIAkJCXJhbmdlcyA9IDwwIDB4NTQwMDQwMDAgMHg0MDA+Owo+IC0JCQlw
aW5zLWFyZS1udW1iZXJlZDsKPiAgIAkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+Owo+ICAg
CQkJc3Qsc3lzY2ZnID0gPCZleHRpIDB4NjAgMHhmZj47Cj4gICAKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

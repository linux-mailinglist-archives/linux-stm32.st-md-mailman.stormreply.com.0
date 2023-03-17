Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 310516BF018
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Mar 2023 18:47:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F64C6907C;
	Fri, 17 Mar 2023 17:47:26 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5674C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 17:47:24 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id d7so6440401qtr.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Mar 2023 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679075243;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UkpnQ8pjRqI+McI410V8kcv0tcTp5sXulpV3DbQRNsI=;
 b=fNL8tRSCHssQd/8QA5Z42BAkK6bbnVSbHT0oHbmSGFFuAFI1YDLLBDJyChAp2DHCtU
 9clE420dHbGEb5crxhaiMs+2AksnYEr/l8peOj8QqgIEgvRQudrzhkWDyMAbPq4xS1aV
 bG3ENhQ7trynAs3ic2evha+J4a1RZEj+GT9wtEEPIY1OH9PR4kGCtUPSvsqEqhQZFMrJ
 EGXt2a9cwlI8VEIyymOO+j0QNyBwXGKzkcwA4+RgJHQTy6/oRiX2m0R/ONJWc9irG35Q
 S3l1j+OBlYEiEOa5D06QlUUQuUlq3dDaBQHoN/ci9pjHcfMYIGtkI94TNchkBCvFg80q
 1BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679075243;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UkpnQ8pjRqI+McI410V8kcv0tcTp5sXulpV3DbQRNsI=;
 b=LCAcamCHveNUx4DFvqee0ofRhk+2J5Vetge/ocI7fa/aQEwnSEaqhi187il2hkGaJu
 TsqFvS1+udSRxP6PunEm4bIy+qPyr4KlRQDk2zz8epEa2YN0f+R1zvD3Vr8wjr6wqS7p
 yWjpL2HqeONY13DuFs0GcWNwbtZUbDgkQ0G21XAlba0fu2oKe2Xmw81b8pZ2xMyjMzrg
 I5hkdWGDD99pu1Juq979Qlam8J8ffL9P0qVCp/bKr+rSqVvMac5bSpNhwMMBngaJyzR+
 a/f+1q5znS0ZDsiIrHf4SGHJf6DgQ5dKL3IJze8uWSTejwuzjG2e1ypOTP8pHoSTnV9h
 GXuA==
X-Gm-Message-State: AO0yUKXj5AEz9N2cPcyiO/GDGGSi3VT/cXULqIqE4fDYCzG64IYxPqM3
 LTAQO5fzAGOpwa9brPxmSvs=
X-Google-Smtp-Source: AK7set/IxjvxjVkJ2Zar1BFwcYo42229feu5dmIbHrAaNNVxrE4sG4PviIBMDXIMvFr+LUX3kpgM6g==
X-Received: by 2002:a05:622a:144c:b0:3b8:68ef:d538 with SMTP id
 v12-20020a05622a144c00b003b868efd538mr11032069qtx.52.1679075243636; 
 Fri, 17 Mar 2023 10:47:23 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 j68-20020a37b947000000b0074577e835f2sm2078168qkf.48.2023.03.17.10.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 10:47:23 -0700 (PDT)
Message-ID: <8985802d-1faa-abd3-0188-49d73fed7a09@gmail.com>
Date: Fri, 17 Mar 2023 10:47:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20230316205449.1659395-1-shenwei.wang@nxp.com>
 <ZBOQecR6q5Xgr75F@shell.armlinux.org.uk>
 <f348ece4-90ef-4368-893a-73de37410fd2@lunn.ch>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <f348ece4-90ef-4368-893a-73de37410fd2@lunn.ch>
X-Topics: 
Cc: Jose Abreu <joabreu@synopsys.com>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/1] net: stmmac: start PHY early in
	__stmmac_open
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

T24gMy8xNy8yMyAxMDozNCwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+IE5BSy4gQSBwYXRjaCBzaW1p
bGFyIHRvIHRoaXMgaGFzIGFscmVhZHkgYmVlbiBzZW50Lgo+Pgo+PiBUaGUgcHJvYmxlbSB3aXRo
IGp1c3QgbW92aW5nIHRoaXMgaXMgdGhhdCBwaHlsaW5rIGNhbiBjYWxsIHRoZQo+PiBtYWNfbGlu
a191cCgpIG1ldGhvZCAqYmVmb3JlKiBwaHlsaW5rX3N0YXJ0KCkgaGFzIHJldHVybmVkIC0gYW5k
IGFzCj4+IHRoaXMgZHJpdmVyIGhhcyBub3QgY29tcGxldGVkIHRoZSBzZXR1cCwgaXQgZG9lc24n
dCBleHBlY3QgdGhlIGxpbmsKPj4gdG8gY29tZSB1cCBhdCB0aGF0IHBvaW50Lgo+Pgo+PiBUaGVy
ZSBhcmUgc2V2ZXJhbCBpc3N1ZXMgd2l0aCB0aGlzIGRyaXZlciB3YW50aW5nIHRoZSBQSFkgY2xv
Y2sgZWFybHksCj4+IGFuZCB0aGVyZSBoYXZlIGJlZW4gdHdvIHBlb3BsZSB3b3JraW5nIG9uIGFk
ZHJlc3NpbmcgdGhpcyBwcmV2aW91c2x5LAo+PiBwcm9wb3NpbmcgdHdvIGRpZmZlcmVudCBjaGFu
Z2VzIHRvIHBoeWxpbmsuCj4+Cj4+IEkgc2VudCB0aGVtIGF3YXkgdG8gdGFsayB0byBlYWNoIG90
aGVyIGFuZCBjb21lIGJhY2sgd2l0aCBhIHVuaWZpZWQKPj4gc29sdXRpb24uIFNob2NrIGhvcnJv
ciwgdGhleSBuZXZlciBjYW1lIGJhY2suCj4+Cj4+IE5vdyB3ZSBzZWVtIHRvIGJlIHN0YXJ0aW5n
IGFnYWluIGZyb20gdGhlIGJlZ2lubmluZy4KPj4KPj4gc3RtbWFjIGZvbGsgcmVhbGx5IG5lZWQg
dG8gZ2V0IGEgaGFuZGxlIG9uIHRoaXMgc28gcmV2aWV3ZXJzIGFyZSBub3QKPj4gaGF2aW5nIHRv
IE5BSyBzaW1pbGFyIHBhdGNoZXMgdGltZSBhbmQgdGltZSBhZ2FpbiwgcmVzdWx0aW5nIGluIHRo
ZQo+PiBwcm9ibGVtIG5vdCBiZWluZyBzb2x2ZWQuCj4gCj4gQW5kIGp1c3QgYWRkaW5nIHRvIHRo
YXQsIERldmVsb3BlcnMgc2hvdWxkIGFsc28gZ2V0IGludG8gdGhlIGhhYml0IG9mCj4gc2VhcmNo
aW5nIHRvIHNlZSBpZiBzb21lYm9keSBoYXMgYWxyZWFkeSB0cmllZCBhbmQgZmFpbGVkIHRvIHNv
bHZlIHRoZQo+IHByb2JsZW0uCj4gCj4g4oCcVGhvc2UgV2hvIERvIE5vdCBMZWFybiBIaXN0b3J5
IEFyZSBEb29tZWQgVG8gUmVwZWF0IEl0LuKAnQo+IAo+IFRyeSBhdm9pZGluZyB3YXN0aW5nIGV2
ZXJ5Ym9keSdzIHRpbWVzIGJ5IGxlYXJuaW5nIGEgYml0IG9mIGhpc3RvcnkuCgpUaGlzIGlzIGEg
dG91Z2ggcHJvYmxlbSB0byBzb2x2ZSB0aG91Z2gsIHdlIGhhdmUgaGFkIHNpbWlsYXIgaXNzdWVz
IGluIAp0aGUgcGFzdCB3aXRoIHRoZSBHRU5FVCBkcml2ZXIgd2hlcmVieSB3ZSBuZWVkIHRoZSBQ
SFkgY2xvY2sgaW4gb3JkZXIgdG8gCmNsb2NrIGNlcnRhaW4gcGFydHMgb2YgdGhlIE1BQydzIHJl
Y2VpdmUgcGF0aCB0byBlbnN1cmUgaXQgY29tcGxldGVzIGl0cyAKcmVzZXQuIFRoaXMgaXMgYSB0
ZXJyaWJsZSBkZXNpZ24gdGhhdCB1bmZvcnR1bmF0ZWx5IGEgbG90IG9mIGRlc2lnbmVycyAKZ2V0
IHdyb25nLgoKRXZlbnR1YWxseSB3ZSBmb3VuZCB0aGF0IHdlIGhhZCB0aGlzICJhdXRvLWNvbmZp
Z3VyZSIgZmVhdHVyZSB3aGljaCAKY291bGQga2ljayBpbiB3aGVuIHRoZSBQSFkgaXMgdXAgYW5k
IHJ1bm5pbmcgd2hpY2ggc29sdmVkIGl0OgoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9ODhmNmM4YmYx
YWFlZDUwMzk5MjNmYjRjNzAxY2FiNGQ0MjE3NjI3NQoKdGhvdWdoIGl0IHRvb2sgYSBmZXcgYXR0
ZW1wdHMgdG8gZ2V0IHRoZXJlOgoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NjEyZWIxYzNiOWU1MDRk
ZTI0MTM2Yzk0N2VkN2MwN2JjMzQyZjNhYQoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9M2E1NTQwMmM5
Mzg3N2QyOTFiMGE2MTJkMjVlZGIwM2QxYjRiOTNhYwoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9Mjhj
MmQxYTdhMGJmCgpEb2VzIHNvbWV0aGluZyBzaW1pbGFyIGV4aXQgb24gc3RtbWFjPyBDYW4geW91
IHNvbWVob3cgdXRpbGl6ZSB0aGUgTUFDJ3MgClRYIGNsb2NrIGFuZCBsb29wIGl0IGJhY2sgdG8g
dGhlIFJYIGNsb2NrIHRvIHNhdGlzZnkgYW55IGNsb2NraW5nIApyZXF1aXJlbWVudHM/Ci0tIApG
bG9yaWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=

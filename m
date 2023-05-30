Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 091877166AF
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 17:13:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5E43C6A613;
	Tue, 30 May 2023 15:13:25 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A9E0C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 15:13:24 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2af1822b710so48763241fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 08:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685459603; x=1688051603;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q0/z84vpwzDI0aF57Cc6ksVNfZpqpUHT2FEMjJzlh94=;
 b=DLZkgFZOM1gND9DmdiaAJM9g+tCWyWEsy1rkK9h2UTsv0Xf9cVeV39g4AF38Q4a/Hw
 N6HHkBeepqYGI9sL+Ukzk6jnP7mAPiRveUI36F787m14Px3yeYH7NzwNJF/AZafarbVq
 XHnNv5dQTUQ6/m4RGdrYDAW0Dqd2mWwiyd2xjia9Q+oZsYiMigwHxBusSGdfTTZBdIna
 z+TYxlrWo8LbxJFUjuv79mi5xPR7boJfEpvpRTpFXH6APgKufjExoZ68nUzFXjBhlQjJ
 xYhGnSOM33ER6+mwu5KyqFhFGrvaKyrkH+KNckfje7ENSrETpl2ps6DKAk1ZUm/dqRj3
 E2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685459603; x=1688051603;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0/z84vpwzDI0aF57Cc6ksVNfZpqpUHT2FEMjJzlh94=;
 b=fcTXKmVmPp+/BllXEuBWcy9GQZi/gN2agYnHrsueH1AfOB9bNZrGdtv41/DrgOsXdl
 8GwSxIPXMunrTr8udAzci1U07K+4KOibD3Vgx57vmKK+Mw8QT5jMGPN5otzmupkx2L6g
 1+u+uQiHCCKrbczYbKTUAxl6MOzhgPHLbFKt809pW3ynvd7SUtnFGbHyo/1XhzKKA+ht
 bi/cO1WaUMe2HoeIMiSwZhw2+nEyhYe+Q3ET9DFcMIKaq4pUaWXoJWdldfaZxWgFQ+5l
 2zAW6K7qxLFvwAYw4X42nmDrDc4mBmXG+8e8vIPfMhRrRhINN9RsOdlKnfrxMRcl+z3d
 kczA==
X-Gm-Message-State: AC+VfDyZNRggD/H4Uomw1pxmPXI7uEpiKP25CYyl+q7VHxv2kySVM4UP
 750Ks1/TdCOJneDa0oPpuu2M+A==
X-Google-Smtp-Source: ACHHUZ7SvKJbZWJPmeT0C+ABZU3yfrSxqfz3eGl3iFFeZe4ORHtBEQZ2gfN0Dz9DmIpJ5trb7iGK5w==
X-Received: by 2002:a2e:9e59:0:b0:2af:1119:8c77 with SMTP id
 g25-20020a2e9e59000000b002af11198c77mr972198ljk.49.1685459603419; 
 Tue, 30 May 2023 08:13:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a17090622da00b0096f7cf96525sm7578171eja.146.2023.05.30.08.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 08:13:23 -0700 (PDT)
Message-ID: <bf204c54-a51b-21d0-9fbf-3729d277ef76@linaro.org>
Date: Tue, 30 May 2023 17:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
 <20230529091359.71987-3-raphael.gallais-pou@foss.st.com>
 <20230530122736.tflfu5cugbd7ooup@krzk-bin>
 <92d5a699-9f5d-2e40-ca73-4604f3e5a657@foss.st.com>
 <af31ae21-2711-2fac-e885-b3bbbcb12be8@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <af31ae21-2711-2fac-e885-b3bbbcb12be8@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/4] dt-bindings: display: st,
 stm32-dsi: Remove unnecessary fields
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

T24gMzAvMDUvMjAyMyAxNTozOCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPiAKPiBPbiA1
LzMwLzIzIDE1OjMwLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+PiBPbiA1LzMwLzIzIDE0OjI3
LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4gT24gTW9uLCAyOSBNYXkgMjAyMyAxMTox
Mzo1NyArMDIwMCwgUmFwaGFlbCBHYWxsYWlzLVBvdSB3cm90ZToKPj4+PiAiI2FkZHJlc3MtY2Vs
bHMiIGFuZCAiI3NpemUtY2VsbHMiIGFyZSB0d28gcHJvcGVydGllcyB0aGF0IGFyZSBub3QKPj4+
PiBtYW5kYXRvcnkuIEZvciBpbnN0YW5jZSwgdGhlIERTSSBjb3VsZCByZWZlciB0byBhIGJyaWRn
ZSBvdXRzaWRlIHRoZSBzY29wZQo+Pj4+IG9mIHRoZSBub2RlIHJhdGhlciB0aGFuIGluY2x1ZGUg
YSAncGFuZWxAMCcgc3Vibm9kZS4gQnkgZG9pbmcgc28sIGFkZHJlc3MKPj4+PiBhbmQgc2l6ZSBm
aWVsZHMgYmVjb21lIHRoZW4gdW5uZWNlc3NhcnksIGNyZWF0aW5nIGEgd2FybmluZyBhdCBidWls
ZCB0aW1lLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFw
aGFlbC5nYWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KPj4+PiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4+PiBSZXZpZXdlZC1ieTogTWFyZWsgVmFz
dXQgPG1hcmV4QGRlbnguZGU+Cj4+Pj4gLS0tCj4+Pj4gwqAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvc3Qsc3RtMzItZHNpLnlhbWwgfCAyIC0tCj4+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCj4+Pj4KPj4+Cj4+PiBSdW5uaW5nICdtYWtlIGR0
YnNfY2hlY2snIHdpdGggdGhlIHNjaGVtYSBpbiB0aGlzIHBhdGNoIGdpdmVzIHRoZQo+Pj4gZm9s
bG93aW5nIHdhcm5pbmdzLiBDb25zaWRlciBpZiB0aGV5IGFyZSBleHBlY3RlZCBvciB0aGUgc2No
ZW1hIGlzCj4+PiBpbmNvcnJlY3QuIFRoZXNlIG1heSBub3QgYmUgbmV3IHdhcm5pbmdzCj4+IEkg
Y2hlY2tlZCBpdCBiZWZvcmUgbWVyZ2luZyB0aGUgc2VyaWVzIG9uIHN0bTMyLW5leHQgdHJlZS4g
SSBkaWRuJ3QgZ2V0IHRoaXMKPj4gZXJyb3IuIEkgZGlkbid0IGNoZWNrIGNvbW1pdCBwZXIgY29t
bWl0Lgo+Pgo+PiBEbyB5b3UgZ2V0IHRoaXMgZXJyb3IgYWZ0ZXIgbWVyZ2luZyB0aGUgd2hvbGUg
c2VyaWVzID8KPiAKPiAKPiBJIHRoaW5rIHRoaXMgaXMgYmVjYXVzZSBvZiB0aGUgb3JkZXIgb2Yg
dGhlIHBhdGNoZXMgd2l0aGluIHRoZSBzZXJpZS4gVGhlIHBhdGNoCj4gY29ycmVjdGluZyB0aGUg
eWFtbCBpcyBiZWZvcmUgdGhvc2UgbW9kaWZ5aW5nIHRoZSBkZXZpY2UtdHJlZXMuIFRoaXMgY291
bGQKPiBleHBsYWluIHdhcm5pbmdzIHJpc2UgdXAgd2hlbiBjaGVja2luZyBwYXRjaCBwZXIgcGF0
Y2guIEhvd2V2ZXIgSSBkaWQgbm90IGdldAo+IGFueSBlcnJvcnMgb24gdG9wIG9mwqAgdGhlIHdo
b2xlIHNlcmllLgoKWWVhaC4gSWdub3JlIHRoZSByZXBvcnQgaWYgeW91IHRlc3RlZCBpdCBieSB5
b3Vyc2VsZi4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

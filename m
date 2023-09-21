Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F04847A9EEF
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 22:14:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EEFFC6B459;
	Thu, 21 Sep 2023 20:14:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A48AC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 20:14:51 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-1c5dd017b30so6435805ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695327290; x=1695932090;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JyEngoB20EiGdQxWeRrp1wv5Ks/o+AuWbIIGFDAcGkc=;
 b=HwSt/MDd9LjZoy3I1YZPer+K7ninCQ7t8i5Kydpe2YAwPLbmg7aDFKEzTjGytYDxwk
 W0/xKkLLTOyxW3MIHIgpIjtIAQqKz7En/JftlAL6GMsB0euCO4W4s8AFYYdxEvdKmasr
 Dt2e+sLHv+XaWnD3NDgry8EyD5m0z5jIglwCqG/bMZ3tbhigZsfUhhcDIbvltVbtRgZR
 sT89M3nevwWsQRmNd760iGFBA9IFYrMd2J27//bwz2pL5mzbUfRjiphEe3HCLgD426NB
 IxLA211+KGv8gatdthUFA/nn59U6eTSFH1BMudu5TfxwcqpitQ/M+V3J+t6thf50E6ek
 T+Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695327290; x=1695932090;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JyEngoB20EiGdQxWeRrp1wv5Ks/o+AuWbIIGFDAcGkc=;
 b=oY5NalbIZRBQPqhV5LzHmawXvmfI6VHvMAbLfXXs18z0trsYmrOViEp69qla/HgV8A
 qN5Gppe33Z7SS19LLuU1Kl5yRKKyuTRlcpPbcChZBSMizg2UJb/2SuKmT7dtZBgMwb0K
 AOeRGyVBUVB8UO6/DmGPRLtB1fCjS/uhG2h/SboedjjD6pxFj1DCwEKu9pQ1U2yU3VCs
 h52xpiDgXrRsSpw3DuEesEvHImPLAddgJY7CZfTDL2lQeN6Ial1ukG4ym4nRgFhErSya
 7/pcFt5gaP056nyXejMTguN4P2VcL9Y7S4sZQu6XbFH8p1GVSlZjg9Oogy3kTnqx4HQz
 +R3Q==
X-Gm-Message-State: AOJu0YxUys9mgWE/sapfzUvjYkiKnkBWTwEX7uKbIVIFSUa30KyKyUsw
 sxkoYrQFqVjvz/OYuf0Y1wY=
X-Google-Smtp-Source: AGHT+IEXFS/tfXu/U8U2r/q8qDaqvI0FMUVqjfM/+vJynfUb+k1UGCrLSXvalSGl0pBWUjWMwDE6Cg==
X-Received: by 2002:a17:902:ab48:b0:1b7:ca9c:4f5c with SMTP id
 ij8-20020a170902ab4800b001b7ca9c4f5cmr725279plb.28.1695327289856; 
 Thu, 21 Sep 2023 13:14:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a170902c38400b001b8a00d4f7asm1940872plg.9.2023.09.21.13.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 13:14:49 -0700 (PDT)
Message-ID: <b28abd34-a7ef-661a-aafa-3e6c8e963726@roeck-us.net>
Date: Thu, 21 Sep 2023 13:14:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230717160630.1892-1-jszhang@kernel.org>
 <20230717160630.1892-3-jszhang@kernel.org>
 <11fce633-4699-470f-a2f3-94b99b3e6da6@roeck-us.net>
 <20230921195608.dlol2f6fifx6ahd6@pengutronix.de>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230921195608.dlol2f6fifx6ahd6@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Jisheng Zhang <jszhang@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/2] net: stmmac: use
 per-queue 64 bit statistics where necessary
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

T24gOS8yMS8yMyAxMjo1NiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8gR3VlbnRl
ciwKPiAKPiBPbiBUaHUsIFNlcCAyMSwgMjAyMyBhdCAxMTozNDowOUFNIC0wNzAwLCBHdWVudGVy
IFJvZWNrIHdyb3RlOgo+PiBPbiBUdWUsIEp1bCAxOCwgMjAyMyBhdCAxMjowNjozMEFNICswODAw
LCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+Pj4gQ3VycmVudGx5LCB0aGVyZSBhcmUgdHdvIG1ham9y
IGlzc3VlcyB3aXRoIHN0bW1hYyBkcml2ZXIgc3RhdGlzdGljcwo+Pj4gRmlyc3Qgb2YgYWxsLCBz
dGF0aXN0aWNzIGluIHN0bW1hY19leHRyYV9zdGF0cywgc3RtbWFjX3J4cV9zdGF0cwo+Pj4gYW5k
IHN0bW1hY190eHFfc3RhdHMgYXJlIDMyIGJpdCB2YXJpYWJsZXMgb24gMzIgYml0IHBsYXRmb3Jt
cy4gVGhpcwo+Pj4gY2FuIGNhdXNlIHNvbWUgc3RhdHMgdG8gb3ZlcmZsb3cgYWZ0ZXIgc2V2ZXJh
bCBtaW51dGVzIG9mCj4+PiBoaWdoIHRyYWZmaWMsIGZvciBleGFtcGxlIHJ4X3BrdF9uLCB0eF9w
a3RfbiBhbmQgc28gb24uCj4+Pgo+Pj4gU2Vjb25kbHksIGlmIEhXIHN1cHBvcnRzIG11bHRpcXVl
dWVzLCB0aGVyZSBhcmUgZnJlcXVlbnQgY2FjaGVsaW5lCj4+PiBwaW5nIHBvbmdzIG9uIHNvbWUg
ZHJpdmVyIHN0YXRpc3RpYyB2YXJzLCBmb3IgZXhhbXBsZSwgbm9ybWFsX2lycV9uLAo+Pj4gdHhf
cGt0X24gYW5kIHNvIG9uLiBXaGF0J3MgbW9yZSwgZnJlcXVlbnQgY2FjaGVsaW5lIHBpbmcgcG9u
Z3Mgb24KPj4+IG5vcm1hbF9pcnFfbiBoYXBwZW5zIGluIElTUiwgdGhpcyBtYWtlcyB0aGUgc2l0
dWF0aW9uIHdvcnNlLgo+Pj4KPj4+IFRvIGltcHJvdmUgdGhlIGRyaXZlciwgd2UgY29udmVydCB0
aG9zZSBzdGF0aXN0aWNzIHRvIDY0IGJpdCwgaW1wbGVtZW50Cj4+PiBuZG9fZ2V0X3N0YXRzNjQg
YW5kIHVwZGF0ZSAuZ2V0X2V0aHRvb2xfc3RhdHMgaW1wbGVtZW50YXRpb24KPj4+IGFjY29yZGlu
Z2x5LiBXZSBhbHNvIHVzZSBwZXItcXVldWUgc3RhdGlzdGljcyB3aGVyZSBuZWNlc3NhcnkgdG8g
cmVtb3ZlCj4+PiB0aGUgY2FjaGVsaW5lIHBpbmcgcG9uZ3MgYXMgbXVjaCBhcyBwb3NzaWJsZSB0
byBtYWtlIG11bHRpcXVldWUKPj4+IG9wZXJhdGlvbnMgZmFzdGVyLiBUaG9zZSBzdGF0aXN0aWNz
IHdoaWNoIGFyZSBub3QgcG9zc2libGUgdG8gb3ZlcmZsb3cKPj4+IGFuZCBub3QgZnJlcXVlbnRs
eSB1cGRhdGVkIGFyZSBrZXB0IGFzIGlzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcg
WmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4KPj4gWW91ciBwYXRjaCByZXN1bHRzIGluIGxv
Y2tkZXAgc3BsYXRzLiBUaGlzIGlzIHdpdGggdGhlIG9yYW5nZXBpLXBjCj4+IGVtdWxhdGlvbiBp
biBxZW11Lgo+Pgo+PiBbICAgMTEuMTI2OTUwXSBkd21hYy1zdW44aSAxYzMwMDAwLmV0aGVybmV0
IGV0aDA6IFBIWSBbbWRpb19tdXgtMC4xOjAxXSBkcml2ZXIgW0dlbmVyaWMgUEhZXSAoaXJxPVBP
TEwpCj4+IFsgICAxMS4xMjc5MTJdIGR3bWFjLXN1bjhpIDFjMzAwMDAuZXRoZXJuZXQgZXRoMDog
Tm8gU2FmZXR5IEZlYXR1cmVzIHN1cHBvcnQgZm91bmQKPj4gWyAgIDExLjEyODI5NF0gZHdtYWMt
c3VuOGkgMWMzMDAwMC5ldGhlcm5ldCBldGgwOiBObyBNQUMgTWFuYWdlbWVudCBDb3VudGVycyBh
dmFpbGFibGUKPj4gWyAgIDExLjEyODUxMV0gZHdtYWMtc3VuOGkgMWMzMDAwMC5ldGhlcm5ldCBl
dGgwOiBQVFAgbm90IHN1cHBvcnRlZCBieSBIVwo+PiBbICAgMTEuMTM4OTkwXSBkd21hYy1zdW44
aSAxYzMwMDAwLmV0aGVybmV0IGV0aDA6IGNvbmZpZ3VyaW5nIGZvciBwaHkvbWlpIGxpbmsgbW9k
ZQo+PiBbICAgMTEuMTQ0Mzg3XSBJTkZPOiB0cnlpbmcgdG8gcmVnaXN0ZXIgbm9uLXN0YXRpYyBr
ZXkuCj4+IFsgICAxMS4xNDQ0ODNdIFRoZSBjb2RlIGlzIGZpbmUgYnV0IG5lZWRzIGxvY2tkZXAg
YW5ub3RhdGlvbiwgb3IgbWF5YmUKPj4gWyAgIDExLjE0NDU2OF0geW91IGRpZG4ndCBpbml0aWFs
aXplIHRoaXMgb2JqZWN0IGJlZm9yZSB1c2U/Cj4+IFsgICAxMS4xNDQ2NDBdIHR1cm5pbmcgb2Zm
IHRoZSBsb2NraW5nIGNvcnJlY3RuZXNzIHZhbGlkYXRvci4KPj4gWyAgIDExLjE0NDg0NV0gQ1BV
OiAyIFBJRDogNjg4IENvbW06IGlwIFRhaW50ZWQ6IEcgICAgICAgICAgICAgICAgIE4gNi42LjAt
cmMyICMxCj4+IFsgICAxMS4xNDQ5NTZdIEhhcmR3YXJlIG5hbWU6IEFsbHdpbm5lciBzdW44aSBG
YW1pbHkKPj4gWyAgIDExLjE0NTEzN10gIHVud2luZF9iYWNrdHJhY2UgZnJvbSBzaG93X3N0YWNr
KzB4MTAvMHgxNAo+PiBbICAgMTEuMTQ1NjEwXSAgc2hvd19zdGFjayBmcm9tIGR1bXBfc3RhY2tf
bHZsKzB4NjgvMHg5MAo+PiBbICAgMTEuMTQ1NjkyXSAgZHVtcF9zdGFja19sdmwgZnJvbSByZWdp
c3Rlcl9sb2NrX2NsYXNzKzB4OTljLzB4OWIwCj4+IFsgICAxMS4xNDU3NzldICByZWdpc3Rlcl9s
b2NrX2NsYXNzIGZyb20gX19sb2NrX2FjcXVpcmUrMHg2Yy8weDIyNDQKPj4gWyAgIDExLjE0NTg2
MV0gIF9fbG9ja19hY3F1aXJlIGZyb20gbG9ja19hY3F1aXJlKzB4MTFjLzB4MzY4Cj4+IFsgICAx
MS4xNDU5MzhdICBsb2NrX2FjcXVpcmUgZnJvbSBzdG1tYWNfZ2V0X3N0YXRzNjQrMHgzNTAvMHgz
NzQKPj4gWyAgIDExLjE0NjAyMV0gIHN0bW1hY19nZXRfc3RhdHM2NCBmcm9tIGRldl9nZXRfc3Rh
dHMrMHgzYy8weDE2MAo+PiBbICAgMTEuMTQ2MTAxXSAgZGV2X2dldF9zdGF0cyBmcm9tIHJ0bmxf
ZmlsbF9zdGF0cysweDMwLzB4MTE4Cj4+IFsgICAxMS4xNDYxNzldICBydG5sX2ZpbGxfc3RhdHMg
ZnJvbSBydG5sX2ZpbGxfaWZpbmZvLmNvbnN0cHJvcC4wKzB4ODJjLzB4MTc3MAo+PiBbICAgMTEu
MTQ2MjczXSAgcnRubF9maWxsX2lmaW5mby5jb25zdHByb3AuMCBmcm9tIHJ0bXNnX2lmaW5mb19i
dWlsZF9za2IrMHhhYy8weDEzOAo+PiBbICAgMTEuMTQ2MzcwXSAgcnRtc2dfaWZpbmZvX2J1aWxk
X3NrYiBmcm9tIHJ0bXNnX2lmaW5mbysweDQ0LzB4N2MKPj4gWyAgIDExLjE0NjQ1Ml0gIHJ0bXNn
X2lmaW5mbyBmcm9tIF9fZGV2X25vdGlmeV9mbGFncysweGFjLzB4ZDgKPj4gWyAgIDExLjE0NjUz
MV0gIF9fZGV2X25vdGlmeV9mbGFncyBmcm9tIGRldl9jaGFuZ2VfZmxhZ3MrMHg0OC8weDU0Cj4+
IFsgICAxMS4xNDY2MTJdICBkZXZfY2hhbmdlX2ZsYWdzIGZyb20gZG9fc2V0bGluaysweDI0NC8w
eGU2Ywo+PiBbICAgMTEuMTQ2Njg5XSAgZG9fc2V0bGluayBmcm9tIHJ0bmxfbmV3bGluaysweDUx
NC8weDgzOAo+PiBbICAgMTEuMTQ2NzYxXSAgcnRubF9uZXdsaW5rIGZyb20gcnRuZXRsaW5rX3Jj
dl9tc2crMHgxNzAvMHg1YjAKPj4gWyAgIDExLjE0Njg0MV0gIHJ0bmV0bGlua19yY3ZfbXNnIGZy
b20gbmV0bGlua19yY3Zfc2tiKzB4YjQvMHgxMGMKPj4gWyAgIDExLjE0NjkyNV0gIG5ldGxpbmtf
cmN2X3NrYiBmcm9tIG5ldGxpbmtfdW5pY2FzdCsweDE5MC8weDI1NAo+PiBbICAgMTEuMTQ3MDA2
XSAgbmV0bGlua191bmljYXN0IGZyb20gbmV0bGlua19zZW5kbXNnKzB4MWRjLzB4NDYwCj4+IFsg
ICAxMS4xNDcwODZdICBuZXRsaW5rX3NlbmRtc2cgZnJvbSBfX19fc3lzX3NlbmRtc2crMHhhMC8w
eDJhMAo+PiBbICAgMTEuMTQ3MTY4XSAgX19fX3N5c19zZW5kbXNnIGZyb20gX19fc3lzX3NlbmRt
c2crMHg2OC8weDk0Cj4+IFsgICAxMS4xNDcyNDVdICBfX19zeXNfc2VuZG1zZyBmcm9tIHN5c19z
ZW5kbXNnKzB4NGMvMHg4OAo+PiBbICAgMTEuMTQ3MzI5XSAgc3lzX3NlbmRtc2cgZnJvbSByZXRf
ZmFzdF9zeXNjYWxsKzB4MC8weDFjCj4+IFsgICAxMS4xNDc0MzldIEV4Y2VwdGlvbiBzdGFjaygw
eGYyM2VkZmE4IHRvIDB4ZjIzZWRmZjApCj4+IFsgICAxMS4xNDc1NThdIGRmYTA6ICAgICAgICAg
ICAgICAgICAgIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAzIGJlZjlhOGQ4IDAwMDAwMDAwIDAw
MDAwMDAwCj4+IFsgICAxMS4xNDc2NjhdIGRmYzA6IDAwMDAwMDAwIDAwMDAwMDAwIGZmZmZmZmZm
IDAwMDAwMTI4IDAwMDAwMDAxIDAwMDAwMDAyIGJlZjlhZjRhIGJlZjlhZjRkCj4+IFsgICAxMS4x
NDc3NjldIGRmZTA6IGJlZjlhODY4IGJlZjlhODU4IGI2ZjlkZGFjIGI2ZjlkMjI4Cj4+IFsgICAx
MS4xNTAwMjBdIGR3bWFjLXN1bjhpIDFjMzAwMDAuZXRoZXJuZXQgZXRoMDogTGluayBpcyBVcCAt
IDEwME1icHMvRnVsbCAtIGZsb3cgY29udHJvbCByeC90eAo+Pgo+PiBNeSBhcG9sb2dpZXMgZm9y
IHRoZSBub2lzZSBpZiB0aGlzIGhhcyBhbHJlYWR5IGJlZW4gcmVwb3J0ZWQuCj4gCj4gVGhpcyBz
ZWVtcyB0byBiZSB0aGUgaXNzdWUgSSByZXBvcnRlZCBlYXJsaWVyLiBTbyB5b3UgbWlnaHQgd2Fu
dCB0byB0ZXN0Cj4gdGhlIHBhdGNoIHRoYXQgZml4ZWQgaXQgZm9yIG1lOgo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL25ldGRldi8yMDIzMDkxNzE2NTMyOC4zNDAzLTEtanN6aGFuZ0BrZXJuZWwu
b3JnLwo+IAoKVGhhdCBqdXN0IHNob3dlZCB1cCBpbiBtYWlubGluZSBhbmQsIHllcywgb2YgY291
cnNlIGl0IGZpeGVzIHRoZSBwcm9ibGVtLgpBcyBJIHNhaWQsIHNvcnJ5IGZvciB0aGUgbm9pc2Uu
CgpHdWVudGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK

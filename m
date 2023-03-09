Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1A56B2864
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 16:08:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 239FEC6A60D;
	Thu,  9 Mar 2023 15:08:39 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6004C6A609
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 15:08:37 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id y2so2392133pjg.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 07:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678374516;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fb2e+/LBhqy1qArJcc0LH6ryiWZIF1fF20/FD4HTb9E=;
 b=raxE2JLfYJFrOkEc1L/thfw2EB0/kD2YPt1Hf/onnsaJPVcfJfxZHreI3wlNWjqJl0
 kQZywBrKbjhzorCynZfwDYaa6AirY7fwqy19d+fESYSenG6s7vjx6N2ed2Xk3WLji66d
 8y+pmxFf/nq8mFXkLC/CfKWr8FIgja8gO9AlFNdAYY39jgw2XWH+5C8BVVWjXYZ/clSJ
 dMPCX/bi+gfY4x1eTZ7MZ+HvqY6wpiyU47rOh2nNYkgGNOcoGQg33oP04t/yGJ5jeHcP
 wbKeDK60/Vp+yAMiB4Kh7hDTGgaaXlj3nAHYpv87+8P6tSw55JJQdH0L6+vGybVpahoT
 C2gw==
X-Gm-Message-State: AO0yUKVTcdQDcg0vdREuE1xdlzTE8J2AXoKkn/Fg0skDuAFlkGKbWsgt
 D3Z2gv4fDnppwZize3fKctE=
X-Google-Smtp-Source: AK7set9HIFqs2pqzNJARvvLaNtMgezBNiDy+vAdodjLCQk1oU8pDbz1QWsU6Humo4NY5SmTPXBpv+w==
X-Received: by 2002:a17:902:bb8c:b0:19b:c498:fd01 with SMTP id
 m12-20020a170902bb8c00b0019bc498fd01mr17089443pls.11.1678374516260; 
 Thu, 09 Mar 2023 07:08:36 -0800 (PST)
Received: from [192.168.219.102] ([14.4.134.166])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a1709027c0800b0019ce95b1319sm11675234pll.264.2023.03.09.07.08.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 07:08:35 -0800 (PST)
Message-ID: <e75d2a42-4154-e469-bbd7-9409471ab724@ooseel.net>
Date: Fri, 10 Mar 2023 00:08:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Simon Horman <simon.horman@corigine.com>
References: <20230308162619.329372-1-lsahn@ooseel.net>
 <ZAnh0TGtDkVUl/1m@corigine.com>
From: Leesoo Ahn <lsahn@ooseel.net>
In-Reply-To: <ZAnh0TGtDkVUl/1m@corigine.com>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: call
 stmmac_finalize_xdp_rx() on a condition
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

CgpPbiAyMy4gMy4gOS4gMjI6NDAsIFNpbW9uIEhvcm1hbiB3cm90ZToKPiBPbiBUaHUsIE1hciAw
OSwgMjAyMyBhdCAwMToyNjoxOEFNICswOTAwLCBMZWVzb28gQWhuIHdyb3RlOgo+PiBUaGUgY3Vy
cmVudCBjb2RlYmFzZSBjYWxscyB0aGUgZnVuY3Rpb24gbm8gbWF0dGVyIG5ldCBkZXZpY2UgaGFz
IFhEUAo+PiBwcm9ncmFtcyBvciBub3QuIFNvIHRoZSBmaW5hbGl6ZSBmdW5jdGlvbiBpcyBiZWlu
ZyBjYWxsZWQgZXZlcnl0aW1lIHdoZW4gUlgKPj4gYm90dG9tLWhhbGYgaW4gcHJvZ3Jlc3MuIEl0
IG5lZWRzIGEgZmV3IG1hY2hpbmUgaW5zdHJ1Y3Rpb25zIGZvciBub3RoaW5nCj4+IGluIHRoZSBj
YXNlIHRoYXQgWERQIHByb2dyYW1zIGFyZSBub3QgYXR0YWNoZWQgYXQgYWxsLgo+Pgo+PiBMZXRz
IGl0IGNhbGwgdGhlIGZ1bmN0aW9uIG9uIGEgY29uZGl0aW9uIHRoYXQgaWYgeGRwX3N0YXR1cyB2
YXJpYWJsZSBoYXMKPj4gbm90IHplcm8gdmFsdWUuIFRoYXQgbWVhbnMgWERQIHByb2dyYW1zIGFy
ZSBhdHRhY2hlZCB0byB0aGUgbmV0IGRldmljZQo+PiBhbmQgaXQgc2hvdWxkIGJlIGZpbmFsaXpl
ZCBiYXNlZCBvbiB0aGUgdmFyaWFibGUuCj4+Cj4+IFRoZSBmb2xsb3dpbmcgaW5zdHJ1Y3Rpb25z
IHNob3cgdGhhdCBpdCdzIGJldHRlciB0aGFuIGNhbGxpbmcgdGhlIGZ1bmN0aW9uCj4+IHVuY29u
ZGl0aW9uYWxseS4KPj4KPj4gICAgMC4zMSDilII2Yjg6ICAgbGRyICAgICB3MCwgW3NwLCAjMTk2
XQo+PiAgICAgICAgIOKUgiAgICDilIzilIDilIBjYnogICAgIHcwLCA2Y2MKPj4gICAgICAgICDi
lIIgICAg4pSCICBtb3YgICAgIHgxLCB4MAo+PiAgICAgICAgIOKUgiAgICDilIIgIG1vdiAgICAg
eDAsIHgyNwo+PiAgICAgICAgIOKUgiAgICDilILihpIgYmwgICAgIHN0bW1hY19maW5hbGl6ZV94
ZHBfcngKPj4gICAgICAgICDilII2Y2M64pSU4pSA4oaSbGRyICAgIHgxLCBbc3AsICMxNzZdCj4+
Cj4+IHdpdGggJ2lmICh4ZHBfc3RhdHVzKScgc3RhdGVtZW50LCBqdW1wIHRvICc2Y2MnIGxhYmVs
IGlmIHhkcF9zdGF0dXMgaGFzCj4+IHplcm8gdmFsdWUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExl
ZXNvbyBBaG4gPGxzYWhuQG9vc2VlbC5uZXQ+Cj4gSGkgTGVlc29vLAo+Cj4gSSBhbSBjdXJpb3Vz
IHRvIGtub3cgaWYgeW91IGNvbnNpZGVyZWQgZ29pbmcgYSBzdGVwIGZ1cnRoZXIgYW5kIHVzaW5n
Cj4gYSBzdGF0aWMga2V5Lgo+Cj4gTGluazogaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRt
bC9sYXRlc3Qvc3RhZ2luZy9zdGF0aWMta2V5cy5odG1sCgpUaGFuayB5b3UgZm9yIHRoZSByZXZp
ZXcuCgpUaGUgZnVuY3Rpb24gbXVzdCBiZSBjYWxsZWQgZm9yIG9ubHkgWERQX1RYIG9yIFhEUF9S
RURJUkVDVCBjYXNlcy4KU28gdXNpbmcgYSBzdGF0aWMga2V5IGRvZXNuJ3QgbG9vayBnb29kIGFu
ZCB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgbm90IApjbGVhciBmb3IgJ3doeScgYXMgd2VsbC4KSSB0
aGluayB0aGF0J3Mgd2h5IHlvdSBzdWdnZXN0ZWQgZm9yIHVzaW5nICdzdGF0aWMga2V5JyBieSB0
aGUgbGF0dGVyIApyZWFzb24uCgpJIHdpbGwgZWRpdCB0aGUgbWVzc2FnZSBhbmQgcG9zdCB2MiBz
b29uLgoKQmVzdCByZWdhcmRzLApMZWVzb28KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

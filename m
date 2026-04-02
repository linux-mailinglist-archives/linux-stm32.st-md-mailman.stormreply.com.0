Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLTCMuSpzmkgpQYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 19:39:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 620BA38CA0E
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Apr 2026 19:39:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AD63C87ECE;
	Thu,  2 Apr 2026 17:39:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CA87C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Apr 2026 17:39:46 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-486ff3a0fc1so10674775e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Apr 2026 10:39:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775151586; cv=none;
 d=google.com; s=arc-20240605;
 b=Q87tmHp83cKGbv3m3RKyf9mbUOr+iY7GvhoBO35SunasZGloWSytB+mC9H3LEhStqs
 K5Vvo+a0zCCAvoYWqAGoUPaEgffFW+vxC+Tl5A1pno1loff/GmeIPEXpZR2hdym5YN6F
 jWTRTzNNy+JnmW0fdohFwqVlPEL0KmPukjtywoUZRnRX6TAMhY9zLV0dHPiWzINm8kPE
 KGe5BnhHtkhgiFigPczsbigRaC0KUf2N3nSR0gbXh3lksxup84TZ1dtlu4LlYPa2rkFF
 bXuvU8u6qQVPaGTDc5z3HWDiiTiAQp8vcBrfWwB/aYllHF0H1rEjh+Jd2bLGcPUxDI6H
 6Nog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+uPvnhmls11jZMJXidvzLVFFEk2TWAWWR3yks90JsY8=;
 fh=ct47Y/citzGvps40HhzP2dQkkNqUabT+nryjnajGdVU=;
 b=FolEKmU47qLN99BuB99p+fzAG0p+S9Iw8VHIFd9izU6fG1b5rP+zA8e5vAyWpUVt1F
 PolmUAVxcZYktZ7cQB+opm3v87qgD/KPu6hdT+aSdEtW0mcx9pGoEYE59RfXJUUWNist
 it9XoDCbx1Y+cnRte05wBzyrqONEEw6OvPYk74/q/9lkd0G8EBUZSVKv9O/NR4fHgjoF
 SS07Oy/1K8DFGRC1QY9c6285onJVYVJN9kcRp6GAGnyY1CZSxgaXXEcQXE+YhVf9jeDQ
 NdtxPdCqauNyBB1cQ7iR8BblhphwpLadvzht4gjnRg1uFeSx4MelowvU7uNcUGqj0c9m
 R21A==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775151586; x=1775756386;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uPvnhmls11jZMJXidvzLVFFEk2TWAWWR3yks90JsY8=;
 b=l0DiQVWF7YzOqkW74Yj+h9cXApB7fJVkfLi0vXSnxUuhky0NR+eaRClcLHb//GlqtE
 GRerDuiGO2DYsJwfHkAGPTrNnTuCCr2xk7aze7RlI/efcflWtnUYOvov1Gw2tpkmmQvF
 azOCNSyEko/AyP6QfOZKHnFmUO5w1fF2naNo8v6difDBXU3wWvXeIf+4bUoZIzhdZS+7
 WaRsnb5WkAC0hwe+2CrDPDvE4H71HCiTrVn3J23smKINAZkWmm1tFWJaHf/v8XBoIryV
 Y9rLmijR9rQ4YtO3NN2v9230e8twOzwONCG4ej2i0mtA6kMdbW8jVKPqFpkxSZigj7k0
 D6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775151586; x=1775756386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+uPvnhmls11jZMJXidvzLVFFEk2TWAWWR3yks90JsY8=;
 b=iXgNWo5gxJBP2XV35I5cPPihrEcOY1yctowRM9BXZEzM+9LmG2ibaTiOliMoe4DoMi
 /lsuyJZp0BbYDHu4hfZRyLfumHOh7fn4awcNslILZWHw5uffUiDbIvA2b3lD+5txsLJU
 tdEMPJ8I8+8f49ft+lcpOssHHE6qe0rRWm6J5oI7TlWMqgeZNn9MVyL4sQTKErH7+KYS
 JKn6uoCSQcK1p59v9j6y2eJE//J381bhvu8zf8zBy1FKxS1OxDEQJqzg+aDCcNo8iSlo
 9GCrKHRnZZ5yQBJ8ta7TjXfsVtllLzTN/TSmpNmdKMi0sMqOm/ebHlpxkGjMxyjz5eP8
 X3uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXDDdEtusIAX5f5u474KcYYcXGLYo9S22IITPHI7CmOebUnNIyTjuyzkdQ7gFydbJqXoLeNRW67NxpXg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy1mp0/8+pfYmWZ91QtO56o8VoPe3lW3fp2E6jlS/zp1MTVLI+f
 ODv4tN1UZaQsy146crPG41GomWcf1hOJZG9/HTh6wqM/YICtLdYZB3G0itQ7iQH0kRd4xh3d5iC
 uemLylgIu4IarwXJN1sbkU/6Ta1aClno=
X-Gm-Gg: ATEYQzz2cymyPPK4lh18qgZsByJTChFlOkdjpanXDti3tq1LHITupBKO2joaZplY0tL
 1j9hg9xEkU0S1Vk48fpMwSnZz/KjkO7T0ZgnRKg29NXsc4TuQxW7F3OiAyAjqG4lDRB7q2ypknn
 G4WVvjXePgkMAjc+ao9oyg/Ws6OLTInAwhtIxgyKiitlfe3KCmo5a8TxcEbaqb97FUQ3+MPy3WF
 vPbSTJkC57BCqu/7KF3QIRjREWmNkVhuIVjSNi+Qb+BwXqoefNqcuR/G2U+hxNK0UUK/MS5CyYx
 b/JaY9bq3+xKj7HH5AlFPnM8u4j5vVUCvHJQ/d9i
X-Received: by 2002:a05:600c:68a:b0:488:90ac:8f8d with SMTP id
 5b1f17b1804b1-48890ac90fcmr32178355e9.16.1775151585540; Thu, 02 Apr 2026
 10:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260401041929.12392-1-CFSworks@gmail.com>
 <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
In-Reply-To: <ac6kfQ98Xjt3dCGj@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Thu, 2 Apr 2026 10:39:32 -0700
X-Gm-Features: AQROBzDUcpqQpe24gMH4zeWd5eqMpRIPwUS0ch-pgokIhwXtjepCY0luOnTMD-k
Message-ID: <CAH5Ym4g3pbU_bWzMwJMdhEFv4K2sp3pty3g04=0=9Z80_LzW1w@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v4 0/2] stmmac crash/stall fixes when
	under memory pressure
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:fancer.lancer@gmail.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,gmail.com,lunn.ch,google.com,st.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cfsworks@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	NEURAL_SPAM(0.00)[0.207];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 620BA38CA0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAxMDoxNuKAr0FNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPiBJJ3ZlIHRlc3RlZCB0aGlzIG9uIG15IEpl
dHNvbiBYYXZpZXIgcGxhdGZvcm0uIE9uZSBvZiB0aGUgaXNzdWVzIEkndmUKPiBoYWQgaXMgdGhh
dCBydW5uaW5nIGlwZXJmMyByZXN1bHRzIGluIHRoZSByZWNlaXZlIHNpZGUgc3RhbGxpbmcgYmVj
YXVzZQo+IGl0IHJ1bnMgb3V0IG9mIGRlc2NyaXB0b3JzLiBIb3dldmVyLCBkZXNwaXRlIHRoZSBy
ZWNlaXZlIHJpbmcKPiBldmVudHVhbGx5IGJlaW5nIHJlLWZpbGxlZCBhbmQgdGhlIGhhcmR3YXJl
IGFwcHJvcHJpYXRlbHkgcHJvZGRlZCwgaXQKPiBzdGVhZGZhc3RseSByZWZ1c2VzIHRvIHJlc3Rh
cnQsIGRlc3BpdGUgdGhlIGRlc2NyaXB0b3JzIGhhdmluZyBiZWVuCj4gdXBkYXRlZC4KCkhpIFJ1
c3NlbGwsCgpKdXN0IHRvIG1ha2Ugc3VyZSBJIHVuZGVyc3RhbmQgY29ycmVjdGx5OiBiZWZvcmUg
bXkgcGF0Y2hlcywgeW91J3ZlCmJlZW4gb2JzZXJ2aW5nIHRoaXMgcHJvYmxlbSBvbiBYYXZpZXIg
Zm9yIGEgd2hpbGUgKG5vIGludGVycnVwdHMsIHJpbmcKZ29lcyBkcnkpOyB3aXRoIG15IHBhdGNo
ZXMsIHRoZSByaW5nIGlzIHJlZmlsbGVkLCBidXQgdGhlIGR3bWFjNQpkb2Vzbid0IHJlc3VtZSBE
TUEuIChBaCwganVzdCBzYXcgeW91ciBmb2xsb3ctdXAgZW1haWwuKQoKPiBBbnkgaWRlYXM/CgpP
ZmYgdGhlIHRvcCBvZiBteSBoZWFkLCBteSBoeXBvdGhlc2lzIGlzIHRoYXQgZHdtYWM1IGhhcyBh
biBhZGRpdGlvbmFsCnRyaXB3aXJlIHdoZW4gdGhlIHJlY2VpdmUgRE1BIGlzIGV4aGF1c3RlZCwg
YW5kIHRoZQpzdG1tYWNfc2V0X3J4X3RhaWxfcHRyKCkvc3RtbWFjX2VuYWJsZV9kbWFfcmVjZXB0
aW9uKCkgYXQgdGhlIGVuZCBvZgpzdG1tYWNfcnhfcmVmaWxsKCkgYXJlbid0IHN1ZmZpY2llbnQg
dG8gd2FrZSBpdCBiYWNrIHVwLgoKSSB0aGluayB0aGlzIGlzIG5ldyB0byBkd21hYzUsIGJlY2F1
c2UgbXkgUkszNTg4IChkd21hYzQuMjAgaWlyYykKaGFwcGlseSByZXN1bWVzIGFmdGVyIHRoZSBz
YW1lIGNvbmRpdGlvbi4KCllvdSBnYXZlIGEgbG90IG9mIGluZm87IHRoYW5rcyEgSSdsbCB0cnkg
dG8gc2NyYXBlIHVwIHNvbWUKZG9jdW1lbnRhdGlvbiBvbiBkd21hYzUgdG8gc2VlIGlmIHRoZXJl
J3Mgc29tZXRoaW5nIG1vcmUKc3RtbWFjX3J4X3JlZmlsbCgpIG91Z2h0IHRvIGJlIGRvaW5nLiBJ
IHRoaW5rIEkgaGF2ZSBhIFhhdmllciBOWAphcm91bmQgaGVyZSBzb21ld2hlcmUsIEknbGwgc2Vl
IGlmIEkgY2FuIHJlcHJvIHRoZSBwcm9ibGVtLgoKQ2hlZXJzLApTYW0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

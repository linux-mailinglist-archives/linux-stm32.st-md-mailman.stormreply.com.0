Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNkrAYicf2nquQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 19:33:44 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E4C6EA5
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Feb 2026 19:33:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0F71C01E77;
	Sun,  1 Feb 2026 18:33:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9761FCFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Feb 2026 18:33:41 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-432da746749so2094565f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Feb 2026 10:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769970821; cv=none;
 d=google.com; s=arc-20240605;
 b=Pu0kKj2lLhj/69BguhOP488/Z+LKOHpiuoQViO6dhOsc4tFvNZtLwPr2YZNJprpMgH
 3W3UVKCbLRGZDW9noauJGhPHNDjh+zrVX/Y/YeidWIIIqJHrH2IizEL3sWSRZli4AED0
 jokDqomAPR5J+UlzFucua0zydZbdXsI3EhNBKoif2zCWEGgve4u5YSb04yU1y+zZOSD4
 6Ap5rrXzsGlLuyCx8YEDqgCHOgSkVCtiCDfW4I81l4HzH4WrSiWaToVqyJIdvuh4gWy5
 eqaUjtVZPPmQB+M03cvUSay2iAzaDDRIadpD+80M2+IKxWSY4K4yvfiEGqXF85rlyqf3
 Z6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=;
 fh=SY1sszlW88r+KV4HdaMjGH4OpvjAJvv3opHhb++Td50=;
 b=OfVlKx3wDM500kjKUOJqzRw3vQQYBr3zLNzsMgceHawz7F/lefvCAwj0RFeswwjbFF
 Nk0YEUwpr/+pghCOQqVeGdRKitwC8rXniyrJl2u5nYl3ZE63eMtqs+W4/Ij+chPO75nB
 5FNPkOUxKApEdp0OXLws/P394EuQsxTtt601YOlvul4GRBDxca6E/izhW2+oasVi4+Mk
 0brmxn/hsEE8a1xwaQ/NMTF7sFVq7ULoMK3RVlGdwm3+cOowLZw5pUmjTSNsDLRIvH5c
 9J2ErDBnQ+wcOs2XBchsOgOmw5h67sAPLRdFFM3Vr1GOnLVkFpdDb7XsiP98y4CqrgsR
 DSCA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769970821; x=1770575621;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=;
 b=NWeGe/++AMPMZ8k+j32EPaj5AYEXhtPJrU+8nkQSk3TyE4KrV4zJ95UHNgLYgpyqHI
 cAAaJaOmS110zux2ZqJl0H6KgUClvBzJSnQctaWybhNbksCu222H9wPdQsK/PVFwPECm
 eKLrRCmv0ARl3C4deTlyzacIoYsYord5yPlbiBvQAUO1ri+38tZHiFaVMAgppIdiOdDB
 1ZTF8sUW1DptDOGxS9eyVpA/xE/Q2xIpNpM9aaXUGwmlB8dIJLFSz0PQ0692vkodlEro
 MqwFGFHmoxd6gmhC3IZC9hCUCqXgRZTLKCu+gpQHtVFrHFxjSkoJ5QvX2JCT0YPJF6IF
 ErVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769970821; x=1770575621;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ya5yGFEaw5toM9HVuI7d0yc/AabXJ23lQu580Ng5uVA=;
 b=JkScXU4SujkvR9ncwV4Vm06xL9HsGLUu3ct0XSJpQXh441XOfxJ+4bQGT9q8ovuYwG
 YeB3nVlwixJ20MY7AwvVA4+SLEnkLRl/cy7SWn2f5AO5WW7zXK3V8VFj+Iu9dQgTHqq/
 qi5jJhhVUTEcBy3p+P76wptN/VGqcIva2SLyzGQ+5CQsup195YTqkdKPPKGKHGrq7YbC
 74YPjskKacXfGR8PSb+SCYduuIPeXrqhJv+VBfDiNJrGDXdWRXLpgMA5KGshzv81cC4R
 4fMRUoPFNJ1eZaXMppr2bIdYImynPv4lZRhJarbnmzfwDwA+SyGoUOJy9YOa3x2gdjzo
 +uTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtDFi/eWuIUP7wFGYNqYkxTZuZ9Rw4ZnKofDAb+Hgpv9xbSh/ZuZcj3cn4gYn0Bul5HTLxPAk+dVzx5w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9KqwnzLbCGUo4vyRSfqZKIGplHQvTJDufdlV4PvNw8EJrkQzs
 eC/DnGcpJ6vS11gWcAyB8Xcp1nwXAYDKz0/jVGn0zjY2vuAMWTaCQiLghDqDj6/84EyCMk89hS6
 XLdaf+uCyU/jSs0AZMEZZRLEGZeREQys=
X-Gm-Gg: AZuq6aIZVgqjKHZ2DiY+sNCo/Q4UeSmfU4oa+O41I9BVraNEljoOpjIJvrGa4qfvHC6
 Z3LQpNseBGvsYis5gnjHrFKf5RHyY0edNGsNx3qwkYZYw4xewTMmx6otMDmmnDIkNFKI+K1o7N8
 XF2L8X/CTeZ8ZL1I6LP33MfuPof4XN97Nb8OTPR3k//4YSSOONez1lrlFHzLTWfvk0h9I9Xkiva
 cyIqYFyjFzIZZ0ys07YuMqZKIMPfnf9BEzUPnRHI9R1MHGUNagWs3szofF1bK/UI2kWDrk5/SVu
 OheaC6cwZlqo6dCmDB3B546LXqi4QKh/ILGdm/UGTfkmp2lwSs6LlnSpQ6abCcUIHHxh
X-Received: by 2002:a05:6000:1ac8:b0:432:8651:4071 with SMTP id
 ffacd0b85a97d-435f3a8873dmr13278042f8f.18.1769970820751; Sun, 01 Feb 2026
 10:33:40 -0800 (PST)
MIME-Version: 1.0
References: <20260131161250.5047-1-biju.das.jz@bp.renesas.com>
 <20260131161250.5047-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260131161250.5047-3-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 1 Feb 2026 18:33:13 +0000
X-Gm-Features: AZwV_Qj_oRyCrNwk1d4EkOcOrEcSe3PZ-OQGreA6B9xVWTkAhiCPU1GA5dw0no0
Message-ID: <CA+V-a8tj74WYJ=i5y4rg4OEtr_rXh381w9+s+ycn8qjajC4QxA@mail.gmail.com>
To: Biju <biju.das.au@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/2] net: stmmac:
 dwmac-renesas-gbeth: Add support for RZ/G3L SoC
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:geert+renesas@glider.be,m:netdev@vger.kernel.org,m:richardcochran@gmail.com,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:biju.das.jz@bp.renesas.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:bijudasau@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	TAGGED_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,glider.be,gmail.com,bp.renesas.com,lunn.ch,google.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 888E4C6EA5
X-Rspamd-Action: no action

T24gU2F0LCBKYW4gMzEsIDIwMjYgYXQgNDoxNOKAr1BNIEJpanUgPGJpanUuZGFzLmF1QGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+Cj4KPiBDb21wYXJlZCB0byBvdGhlciBSZW5lc2FzIEdCRVRIIHN0bW1hYyBnbHVlIGRyaXZl
cnMsIFJaL0czTCBHQkVUSCBJUCB1c2UKPiB0aGUgdmVyc2lvbiBTeW5vcHN5cyBEZXNpZ25XYXJl
IE1BQyAodmVyc2lvbiA1LjMwKS4gSXQgaGFzIGFuIGV4dHJhIGNsb2NrCj4gY29tcGFyZWQgdG8g
UlovVjJIIGFuZCBoYXMgcHRwX3Bwc19vIGludGVycnVwdHMuIEFkZCBzdXBwb3J0IGZvciBSWi9H
M0wKPiBHQkVUSCBieSByZXVzaW5nIGRldmljZSBkYXRhIG9mIFJaL1YySCBhbmQgY2FuIGJlIGV4
dGVuZGVkIHRvIGFkZCBvdGhlcgo+IGZ1bmN0aW9uYWxpdGllcyBsYXRlci4KPgo+IFJldmlld2Vk
LWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+
IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4KPiAt
LS0KPiB2Mi0+djM6Cj4gICogQ29sbGVjdGVkIHRhZy4KPiB2MS0+djI6Cj4gICogTm8gY2hhbmdl
Lgo+IC0tLQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yZW5l
c2FzLWdiZXRoLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KUmV2
aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4KCkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMKPiBpbmRleCBi
ZTdmNWViMmNkY2YuLjE5ZjM0ZTE4YmZlZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMKPiArKysgYi9kcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yZW5lc2FzLWdiZXRoLmMKPiBAQCAt
MjE0LDYgKzIxNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVuZXNhc19nYmV0aF9vZl9kYXRh
IHJlbmVzYXNfZ21hY19vZl9kYXRhID0gewo+ICB9Owo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIHJlbmVzYXNfZ2JldGhfbWF0Y2hbXSA9IHsKPiArICAgICAgIHsgLmNvbXBh
dGlibGUgPSAicmVuZXNhcyxyOWEwOGcwNDYtZ2JldGgiLCAuZGF0YSA9ICZyZW5lc2FzX2diZXRo
X29mX2RhdGEgfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyOWEwOWcwNzct
Z2JldGgiLCAuZGF0YSA9ICZyZW5lc2FzX2dtYWNfb2ZfZGF0YSB9LAo+ICAgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJyZW5lc2FzLHJ6djJoLWdiZXRoIiwgLmRhdGEgPSAmcmVuZXNhc19nYmV0aF9v
Zl9kYXRhIH0sCj4gICAgICAgICB7IC8qIFNlbnRpbmVsICovIH0KPiAtLQo+IDIuNDMuMAo+Cj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK

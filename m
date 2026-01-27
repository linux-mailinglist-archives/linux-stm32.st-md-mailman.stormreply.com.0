Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGCdOIDFeGmltAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 15:02:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF8954C2
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 15:02:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ECB6C555BE;
	Tue, 27 Jan 2026 14:02:40 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2910C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 14:02:38 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-8230c839409so4550468b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 06:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769522557; x=1770127357;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=75PQCFMMISya6miWyFTo5NFlD+yMTmEC4MBoTSgZA6E=;
 b=Gs2iQ4PXA6VgZ8poWYz/UtEEinqKpr59iM6DE073ZlkHBEK7EI3kldedjWprOcZLcG
 QRq+qrCNT4PVCUczQhLdDo6B0MapBeiHnisjrMMER7sfSYznpR+HDN8MM/H7QaHYjlI1
 wdy33lhYemLzwV18cc70uEqFPwSb2rICXAKR7D745boK+tKyU5Jjtr0mjWrsSVIpj6a0
 UHVk6Iw0DQUM2boyzi/qS4lxLbRPPS6qNJDRlt25dqaYLetgNATdockA5b/WwjhCosnO
 mlH9DQmUbyQTHMS3rWZMJGLWk1pSLeQmIjyotyGcvvObNfOmnWnArhmFguUS+u2xD4P2
 6obw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVl/iqkFtDuFy4dB4iBb9kANk20XFZUcyu8MBrK8bVGqSQpHD9LD3oWQeP2KcKfn08RZtOw8lYrOpqhw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw9FBOUe2uWvlvYswkH5AFe+wP0m7X/7IbEc5O2NH0LwwR6WPAu
 CtHP0IZhdz/XTu0iq5bWu5gnMdnl/KoC9A9VZzScabTNCYwHIXuh6BrgS9zxMXUU
X-Gm-Gg: AZuq6aJNSYMpg8ebTuLofl0Q6QuyrLlyYg/UGggyBrxpfQcxHqv+EyOHeYTY7j55Luj
 3ML68pG5PVK3IjXQz16nbOCwGwmq52TFE2pKhZ1PhBAtkODd3bkvwhXUO3f9X5mh5Sk3qiUOpWK
 kpzTryIcKpwov0tOT4mNcuywB1DIXrDcAt6bG4tiv7frkdXhNFG6vR5misRL1VxboyCBDUJ8ae4
 6/WJlH/ZFHw4ymRDMrRK6xQ8zKQzHuuPMtnVs5EiDORTXxSS717UKNaPU+DSSpYh2QbrVVbBGCa
 nfALyfvSRE6AWJ+zVkQZ7LHlcsqbAdCG0EMYRX1vKjTmxVaUx9aci4HSKdrdByu7cb6ZEIqszMP
 Rz2PIlRZjeCwc5tbt3dH4dAM0wRr580ILYjTSmxwuriUlKXhuzwvWq177Fb9+dTGiMvvVqKbq0W
 29B6e4X6bKESJXIyQU/HmsauGKmiwCabawUfca5heX8lk85FgS0H1BRhDv9AGhXXo=
X-Received: by 2002:a05:6a21:2e18:b0:366:2416:194 with SMTP id
 adf61e73a8af0-38ec6421ecfmr1674981637.47.1769522556682; 
 Tue, 27 Jan 2026 06:02:36 -0800 (PST)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com.
 [209.85.210.179]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c635a3f1ebesm11460895a12.19.2026.01.27.06.02.36
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 06:02:36 -0800 (PST)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-81f5381d168so5316778b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 06:02:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWoHA4HBh6v4SNmtwat45wlQ5thFXdFvzQF1RhAuI8zjzIjKg+PpwBntxA4tGI2jI1CP/wGTY2Kgx+X4w==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6122:78b:b0:563:8339:6201 with SMTP id
 71dfb90a1353d-566795e7f59mr418577e0c.17.1769522244153; Tue, 27 Jan 2026
 05:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20260126172503.238724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aXeuR_YLoAFYEAVi@shell.armlinux.org.uk>
 <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
In-Reply-To: <CA+V-a8t5RKY9vyFDg0V3AWcBovBdWbcvqdPeiPYmHRA8v2=UGQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Jan 2026 14:57:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
X-Gm-Features: AZwV_QgbBo9gCTeM_9WEMxs9EnfZIFfAoe0fWXmaoPkXJK4PoXh0OCn_st1Xl0A
Message-ID: <CAMuHMdXOMMyYrbPr8H3O+oj7QeGg324jXdV1QUaUhQF4sxTyfg@mail.gmail.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH net-next] net: stmmac: Preserve
 bootloader MAC address across unconditional reset
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:linux-kernel@vger.kernel.org,m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:netdev@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:fabrizio.castro.jz@renesas.com,m:linux-renesas-soc@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:biju.das.jz@bp.renesas.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:prabhakarcsengg@gmail.com,m:geert@glider.be,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,pengutronix.de,glider.be,bp.renesas.com,st-md-mailman.stormreply.com,armlinux.org.uk,renesas.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns,linux-m68k.org:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 89DF8954C2
X-Rspamd-Action: no action

SGkgUHJhYmhha2FyLAoKT24gVHVlLCAyNyBKYW4gMjAyNiBhdCAxNDozOSwgTGFkLCBQcmFiaGFr
YXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiBPbiBNb24sIEphbiAyNiwg
MjAyNiBhdCA2OjEx4oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCj4gPGxpbnV4QGFybWxpbnV4
Lm9yZy51az4gd3JvdGU6Cj4gPiBPbiBNb24sIEphbiAyNiwgMjAyNiBhdCAwNToyNTowM1BNICsw
MDAwLCBQcmFiaGFrYXIgd3JvdGU6Cj4gPiB3aGVyZSAibG9jYWwtbWFjLWFkZHJlc3MiIHN0YXRl
cyB0aGUgTUFDIGFkZHJlc3MgdG8gYmUgdXNlZCBmb3IgZXRoMCwKPiA+IGFzIHNwZWNpZmllZCBi
eSB0aGUgYm9vdCBsb2FkZXIuCj4gPgo+IFRoYW5rcyBmb3IgdGhlIHBvaW50ZXIsIEkgd2lsbCB1
c2UgdGhlIGFib3ZlLW1lbnRpb25lZCBtZXRob2Qgd2l0aAo+IHdoaWNoIHdlIHdvbid0IGJlIG5l
ZWRpbmcgdGhpcyBwYXRjaCBvbiB0aGUgUlovVDJIIHBsYXRmb3JtLgoKVGhpcyBzaG91bGQgYWxy
ZWFkeSB3b3JrIG91dC1vZi10aGUtYm94LCBhcwphcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMv
cnp0MmgtbjJoLWV2ay1jb21tb24uZHRzaSBhbHJlYWR5IGhhczoKCiAgICBhbGlhc2VzIHsKICAg
ICAgICAgICAgZXRoZXJuZXQzID0gJmdtYWMxOwogICAgICAgICAgICBldGhlcm5ldDIgPSAmZ21h
YzI7CgpTbyBqdXN0IG1ha2Ugc3VyZSB0byBzZXQgdGhlICJldGgyYWRkciIgYW5kICJldGgzYWRk
ciIgZW52aXJvbm1lbnQKdmFyaWFibGVzIGluIFUtQm9vdC4KCkdye29ldGplLGVldGluZ31zLAoK
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
CgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBq
dXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=

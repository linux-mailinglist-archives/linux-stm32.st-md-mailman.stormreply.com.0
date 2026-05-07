Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJScMMki/WmGYAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 01:39:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D24F02DB
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 01:39:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B099C8F289;
	Thu,  7 May 2026 23:39:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B698C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 23:39:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 864686091C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 23:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3460BC2BCFC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 23:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778197190;
 bh=vFH+WCKmJFo+oFxj5WEkyqvJ7Aj4l64pwYaHYcrT4og=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QvtxiuAs5eVQPns7jJlqtGTfdl0EJbsvK9NI8npq8OMLSMiSWuCojWaz5XpXCmsan
 Wrki/Tmn5sP1n1hrh9a2tAMgBvgvMEetyZYlRhkxOrQVeYBuNqQAl5EXhaTsb/gSNR
 N3tDJQnEgUpi+Ise+Rk6oQ7UnD9f6R7jz6KRO3R1A/xImq8iYtkSFjrHRyKlIJgIL5
 ASW+UJLGkyWDkDPCeYIjie9iYtMbF/4k/99cseI+aVLIVKfYiQesyhpsoJ+guYxgOD
 it0716QbosCqZPJKCq+d0pprmnZzhD3cOjygZs+ebux/Q4N4ntZL4+fwJKlOkXvmkE
 QFWR3BZF83oDA==
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-67e2498f3a7so2005722a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2026 16:39:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ/wxZ0Rt6EUN0GwOpajwqJAmDwE9ieFT0OjCsYNaGFmmDM707Df2sIFD+1aNsnOvd/6ROpsncbjy+/SuA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyxMbxnfIaAvYa0/JUTPbmB6Q/0xFoPbJa17W6TxcLhovpu4DAg
 baSssCfGJLdsQLvK69KnAemsyYKFhquUxInzUdFYooEZZ6ctd8BdKDNzDJ+TXnHiC4GMJuHnBfi
 qrnsgbCWDMzjE7O5RFChbP+1sT7ZDtA==
X-Received: by 2002:a05:6402:2113:b0:67c:1ed6:2793 with SMTP id
 4fb4d7f45d1cf-67d648a74e5mr5797376a12.22.1778197188726; Thu, 07 May 2026
 16:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
 <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
In-Reply-To: <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 May 2026 18:39:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKayEDa2-FDoxM_JU3Yvevd-Gs_eFKCQ8NY8A8oBsD13w@mail.gmail.com>
X-Gm-Features: AVHnY4K23N33ivg6cLD9mNxL7odw3uUNL3DiEAJ7jfws_C2Zwld0dAM-keay8pI
Message-ID: <CAL_JsqKayEDa2-FDoxM_JU3Yvevd-Gs_eFKCQ8NY8A8oBsD13w@mail.gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: Andrew Lunn <andrew@lunn.ch>, me@ziyao.cc, ast@kernel.org,
 linux-kernel@vger.kernel.org, Daniel Thompson <daniel@riscstar.com>,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 08/12] dt-bindings: net: toshiba,
 tc965x-dwmac: add TC956x Ethernet bridge
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
X-Rspamd-Queue-Id: 593D24F02DB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.69 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a098720
 3069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.826];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,0.0.0.0:email,riscstar.com:email,1c:email,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: add header
X-Spam: Yes

T24gVGh1LCBNYXkgNywgMjAyNiBhdCA1OjE34oCvUE0gQWxleCBFbGRlciA8ZWxkZXJAcmlzY3N0
YXIuY29tPiB3cm90ZToKPgo+IE9uIDUvMS8yNiAxMjozOCBQTSwgQW5kcmV3IEx1bm4gd3JvdGU6
Cj4gPiBXaHkgbm90IGFkZCBhbiBzdWJub2RlcyBmb3IgdGhlIGV0aGVybmV0IGludGVyZmFjZXM/
Cj4KPiBXZSB3aWxsIGRlZmluZSAiZXRoZXJuZXQiIGRldmljZXRyZWUgc3Vibm9kZXMgb2YgdGhl
IFBDSWUgZnVuY3Rpb25zCj4gaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLiAgU29t
ZXRoaW5nIGxpa2Ugd2hhdCdzIGJlbG93LgoKQXJlIHRoZXkgUENJZSBmdW5jdGlvbnM/IEFzIGlu
IGJ1cywgZGV2LCBmdW5jdGlvbiBhZGRyZXNzZXMuIEhvdyB0byBkbwpmdW5jdGlvbnMgaXMgYWxy
ZWFkeSBkZWZpbmVkIGJ5IHRoZSBQQ0kgYmluZGluZy4KCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC1BbGV4Cj4KPiBwY2lAMCwxIHsKClRoZSAwIGhlcmUgaXMgZGV2
bnVtIGFuZCB0aGUgMSBpcyBmdW5jdGlvbi4KCj4gICAgICAgICAgY29tcGF0aWJsZSA9ICJwY2kx
MTc5LDAyMjAiOwo+ICAgICAgICAgIHJlZyA9IDwweDUwMTAwIDB4MCAweDAgMHgwIDB4MD47Cj4g
ICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8Mz47Cj4gICAgICAgICAgI3NpemUtY2VsbHMgPSA8
Mj47Cj4gICAgICAgICAgZGV2aWNlX3R5cGUgPSAicGNpIjsKPiAgICAgICAgICByYW5nZXM7Cj4K
PiAgICAgICAgICBldGhlcm5ldCB7Cj4gICAgICAgICAgICAgICAgICBwaHktbW9kZSA9ICJzZ21p
aSI7Cj4gICAgICAgICAgICAgICAgICBwaHktaGFuZGxlID0gPCZ0Yzk1NnhfZW1hYzFfcGh5PjsK
Pgo+ICAgICAgICAgICAgICAgICAgbWRpbyB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAic25wcyxkd21hYy1tZGlvIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNl
bGxzID0gPDA+Owo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIHRjOTU2eF9lbWFjMV9waHk6
IGV0aGVybmV0LXBoeUAxYyB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWQwMDRkLmQxMDEiOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLi4uCj4gICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiAgICAgICAg
ICAgICAgICAgfTsKPiAgICAgICAgIH07Cj4gfTsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK

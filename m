Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B6svCGB6JmpmXAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 10:16:32 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA2653E8C
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 10:16:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="W224uC4/";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7054EC5F1D4;
	Mon,  8 Jun 2026 08:07:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3A08C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 08:07:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AEFB6601FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 08:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65A541F00893
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780906037;
 bh=7p3nTq7oGJJLZEtBHFjP4g2fj9ud/Z4fq7Xd0f8dF48=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc;
 b=W224uC4/IesJ34nuGEK+bZHPRAWeHalBbhvVaG3G77FpiSk+P8FmAM4KSth5/Zw6w
 L13BquVoXpaByhyynZxt7GPU3AtAhGunIkXPNSFx3YiuS0/1CNLiwwuQj8q0mLPJoH
 mc5nMCfL/id94JmzJB+LonJwSB2TNbYbx+zME9Z9TRPqfykSaTXwio7ErKUz/VvjvU
 9wrPsC0Di2YZZQoONx0IKIcxFfo7+ck0eL9OFSazszKoJpmUP7QFdp911LcKlJe99I
 g4TYxqSMC1Jl0PopCrS7zm8ggyKQ4c4sqCmK3JCgJACt9c1z/xa8OdOFMb9uT0YD1z
 wV4SQYMmT3UVg==
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-396770cdcfdso41758341fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2026 01:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+/TdKNl6487UccNOn6WQHpWJymKzFyeKDm6EiZJZwVYBk/XMoMxZLfjW5zxjya5sOPR6WdE6CGErTAcw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTTaFA0bLJl8o8DbFvSjyQQBADrs/yXzArLykk4svKLEtg8G1e
 9TuwaZFqpyaO96ryosu5zg/74oYhPI78tfvLcetOAVn7cGSxje4lVAEgaAe7lWEmUl21TH94gn4
 4hdu3bBaWI1cF7UWQHVaCAU5Nyl0SzDg=
X-Received: by 2002:a2e:9a16:0:b0:396:a6d3:f04d with SMTP id
 38308e7fff4ca-396d0895474mr40010161fa.14.1780906035688; Mon, 08 Jun 2026
 01:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-3-elder@riscstar.com>
In-Reply-To: <20260605010022.968612-3-elder@riscstar.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:07:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLnzaq+SghqjQhmS-wzJn8BqtpO9eFBet-Nvq1s6ftSPBA@mail.gmail.com>
X-Gm-Features: AVVi8CdcVQZ5J_i_Iaqeix6_8YO_cjEHpzPIFDPmZBuvgJ3k-aHEuVOqwusuDcs
Message-ID: <CAD++jLnzaq+SghqjQhmS-wzJn8BqtpO9eFBet-Nvq1s6ftSPBA@mail.gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 maxime.chevallier@bootlin.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 kuba@kernel.org, pabeni@redhat.com, konradybcio@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, hawk@kernel.org,
 arnd@arndb.de, brgl@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 linux-gpio@vger.kernel.org, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, andersson@kernel.org, a0987203069@gmail.com,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/14] net: phy: qcom:
	qca808x: Add regulator management
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,lunn.ch,davemloft.net];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS(0.00)[m:elder@riscstar.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:a09
 87203069@gmail.com,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:davem@davemloft.net,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[47];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ADEA2653E8C

SGkgQWxleC9EYW5pZWwsCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBGcmksIEp1biA1LCAy
MDI2IGF0IDM6MDDigK9BTSBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+IHdyb3RlOgoK
PiBGcm9tOiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbEByaXNjc3Rhci5jb20+Cj4KPiBRQ0E4MDgx
IGFwcGVhcnMgaW4gZW1iZWRkZWQgYm9hcmQgZGVzaWducyBwYWlyZWQgd2l0aCBHUElPIGNvbnRy
b2xsZWQKPiByZWd1bGF0b3JzIGZvciBpdHMgcG93ZXIgcmFpbHMuIEFkZCBsb2dpYyB0byBhbGxv
dyB0aGVzZSByZWd1bGF0b3JzIHRvCj4gYmUgdHVybmVkIG9uIGR1cmluZyBhIHByb2JlLgo+Cj4g
SW4gb3JkZXIgdG8gYXZvaWQgdGhlIGNvbXBsZXhpdHkgb2YgdHJhY2tpbmcgc3RhdGUgZm9yIHN1
c3BlbmQgd2l0aCBhbmQKPiB3aXRob3V0IFdvTCB3ZSB0YWtlIGEgdHJlbWVuZG91c2x5IHNpbXBs
ZSAiYWx3YXlzLW9uIiBhcHByb2FjaCB0bwo+IHJlZ3VsYXRvciBtYW5hZ2VtZW50LCBlc3NlbnRp
YWxseSByZWx5aW5nIG9uIEJNQ1JfUERPV04gdG8gY29uc2VydmUKPiBwb3dlciB3aGVuIHRoZSBw
aHkgZGV2aWNlIGV4aXN0cy4KPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFu
aWVsQHJpc2NzdGFyLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckByaXNj
c3Rhci5jb20+CgooLi4uKQoKPiArI2lmZGVmIENPTkZJR19PRgoKSXMgdGhpcyBhbiBleHRyZW1l
bHkgZm9vdHByaW50LXNlbnNpdGl2ZSBzeXN0ZW0/CgpSZWd1bGF0b3JzIHByb3ZpZGUgc21hbGwg
c3R1YnMgaWYgdW51c2VkLCBJIGRvbid0IGtub3cgaWYgdGhleQpjb21waWxlIHRvIHplcm8gYnl0
ZXMgYnV0IHRoaXMgaWZkZWZmZXJ5IHNob3VsZCBub3JtYWxseSBub3QgYmUKbmVjZXNzYXJ5LCBq
dXN0IHVuY29uZGl0aW9uYWxseSBnZXRfZW5hYmxlIHRoZSByZWd1bGF0b3JzLgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK

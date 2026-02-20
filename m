Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sxgAMyOqmGn5KgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Feb 2026 19:38:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F916A1FA
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Feb 2026 19:38:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCD2CC87ED5;
	Fri, 20 Feb 2026 18:38:26 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1753C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Feb 2026 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
 s=s1-ionos; t=1771612693; x=1772217493; i=marcel@ziswiler.com;
 bh=44XHMM4HiGXVuuiMEAL+Zgb1brCATCabA15+Bi10vBM=;
 h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DAnaaMy6FMfhZ2PwdSqRhG6MDuqyQSedE3vAoFZG2GKJyuf7AQZdNa+TVtKceOxx
 GLmKB7Tv5VuGCHD28ItratLbK71EFbbQm+dmXH9N620NvrwUDe5RAjTEtLUUiCXwz
 O7dIHZi+slXQOabDs5OuDN3gYk0al+6SEf5PnAqBnU6oa9NcHfjk/TI/TNS9K0uiH
 M6ACFR42VCrBf8H33PT/Fer/XdQIuBWF639rVTsW3LVEzzMhfowmPvK9byB+AQQdu
 I+8q0G2BRF/oHFxumh/eJvAPAN+HrO0qHE9bxJS+2uaDeEG7mTqVpWHZwYPyHe8RV
 Dq4iINyHX16t7NT5hg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.118.255.253] ([213.55.199.191]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0Lz5KI-1vgDll0QdM-00szjr; 
 Fri, 20 Feb 2026 19:38:13 +0100
Message-ID: <5f99968ec561631852bfa72aea95a100dcad5324.camel@ziswiler.com>
From: Marcel Ziswiler <marcel@ziswiler.com>
To: lizhi2@eswincomputing.com, devicetree@vger.kernel.org, 
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, 	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, 	rmk+kernel@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 20 Feb 2026 19:37:57 +0100
In-Reply-To: <20260209094628.886-1-lizhi2@eswincomputing.com>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
User-Agent: Evolution 3.58.3 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:u/DHXNq2KmbH+PEHVvmwb1sDGASiAHHbzFo0qypFQSmu/f9iPyH
 wIM60ITAsgVE8zKq8x4W1mwI7OIQOsFfVkvxZRDQ/IfplOt1qrRxMT6waj53uIDR6B0mFaH
 Z4w1OMjNf7s8ziypBjWDeR6Yd9ZHavHCf74toT1z82gG9kf+RbwYNYWNhEkfY8pDrtHDG2H
 m4hi7rLnCghPmV2u0uXDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N6VQHXQ2V8M=;i1WrHzikZoZ7F0hufQ6NBs+Gb5n
 oH6rserJeM//8krLCVRcJ/pddwD2cVa9puBHNwbNwuk4xlNPEHditbXxpT5GM0acxINOndcsR
 Rf+3DD8vdBcbn9DKYRYHzC06qZz+Wjwd30xVa2pn/yiBDNguVvhc5BJsURC4Vv/JRiZ0d+dt6
 wca8DNjfhUVWJf5/NbgsV115cWGBw4BmtLLvnzUXRXPz7ie2FDOHlfoh0yl3NPRGlNF7TzW9L
 ijaNRUkrSyAfIWFJxnCSYZ1BR6/iYnnSruZ0qG5BK/tSji6vL5RRQaXsNnkt3KWK84hjINfSX
 lCrTQr/ozD82tIXG1zYO4/zmF6AeMn2YP+2Mg6WlLemR57XQrTUVrO9Xtg+gyG0V0XhKH6TqW
 1rJuye+jU5eT8DIxCBiTircrRrk3csG6f74zK+ZOBLxHqYcS2+lMncGgfnRtHPN5TVp+1keV6
 HzFiNxvUHpQfDCZRgm3T2bo8UxctBeDFFA6+ZIempWQMBaejqqfYaUYNa3P5KjtOhDwQdCzRa
 9migtwklYqWSxK859ArT8bW/RtRTU0m0ZV7GJznJlNxg/WQGr33O9mvoIJiMVRhtatocGzQc9
 yEVkV+1P+8IVSAhH4PMdGAAr371DT3jXAljNPvhl2wf4/VNFqPAg4BLyr3oEI242e5jM8rHCh
 0KupWh5l8/npu8bMRqdhe/vnaIB54/JQwvnwPF8BLUcZxu+90AZSGFSrMHlkntMfc+voFDDZY
 c0RubH/Fk9RlxiV1wwlLmZxz58H4Q1+YjvMSNlRQ/aMcHBUOIRzB3i3kxps+zd+hS8zbQPeex
 1XfXfjwuP4aaP6RCPgc0dAdAjfsLDF5X54IPWF70HP+vCv3bMjoRvddeiIG5EGLTa7OcSUU/I
 SND3jUpSUL/qRCNJkL2Qnnx9KEln4eSNtFAYg03UsNL7pmY8vN0RRfSja2U2IZCE3MZc+Fgop
 tAhUHhrquw6UyognU34C2bh0nfBCL9K9lFWpML0qZOAcsJzLIqeElM90W5y/uZaWkzfc1hRK+
 A8J/5zRkSwgErPv1zsvVyQst119Jyrh1UYfdmiVqXFn3CPbonQGd8wfyUVN8qqYJ1o4OCShq9
 MRvHzk0e2e5cldL2F+gjdqJzQ8DCaP68Y6sAiCdPmEu6xMXlC9CSeylpEUgw2MqKRBFuzWtp6
 HAFDgZhQnRbCB6PJaV0GIQZbxDR2kgVQETIBQPqiah77F/ZeSvzMWRDMbxPJ1CT4sJBc4ONff
 OL2vcgxS+Uq13qZNfBWu4fIQOx8XwhlOEsaLWMcSc4Snhzl3LvA7Xs47hyeCbUg9KIBWB7kvq
 3KGl12WYWhtjeLlotTFhxdhydAQfnqha7FayK+F4OG8CvpLm0CLwnrtafdtS/2OxNUeKEcTNw
 REvgRxdSNiFS2Vyzf/uz/18a0ovUr5eTEzgJ3pzy9PB8ignGLzbTDrzqHPGUhp8F81mDOtAfk
 I7DcUOxhuvKwC0hKn1XkY1Howm0Jd8KvNkaO08A6wpvLU0cHPBvHxWq1LdZLudKUo63B5SMDy
 WEDsyQf7ic6/Vg4OjRPYBN6TmqlQ5eOuSW5p8KHwyQQe8JUGMTY6iTRzMSn47IQ4HA8Nxo/zr
 eUGSrww3xksxxB7QJJphJiw6xyIG72llXqAvBTpYSbcyE9CrRRfTkKfH3l2mAh0dRzU5UD98p
 Ddde3hkuSAOajGNH3CwM4Rt9C5JglSNQrbO3j+8lqbLFaHVY7GL2nIV5gCDqPIeZNNOFw8iL5
 scHG/VjxQrgDlK+cDfyUWij3BzqEah5g6UCgjhg0RWWN5LZ2cCVgtlHRodSc1QEUuohAtwE9v
 Q+mH
Cc: ningyu@eswincomputing.com, pinkesh.vaghela@einfochips.com,
 weishangjuan@eswincomputing.com, linmin@eswincomputing.com,
 dongxuyang@eswincomputing.com
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700
 eth1 RX sampling timing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[ziswiler.com:s=s1-ionos];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ziswiler.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[eswincomputing.com,vger.kernel.org,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER(0.00)[marcel@ziswiler.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:devicetree@vger.kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:netdev@vger.kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:ningyu@eswincomputing.com,m:pinkesh.vaghela@einfochips.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:dongxuyang@eswincomputing.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcel@ziswiler.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[ziswiler.com:-];
	NEURAL_HAM(-0.00)[-0.923];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 626F916A1FA
X-Rspamd-Action: no action

Hi Zhi Li

Sorry, to steal this thread, but I do have a quick question concerning Ethernet on the EIC7700. Every time I
enable gmac0 in the device tree my EBC7700 stops booting (e.g. SD card is no longer detected) while Ethernet
does seem to at least get detected. This has been seen using next-20260219, stable v6.19.2 [1] as well as
6.18.0-rc6 [2]. Any idea what could be going wrong?

I admit so far I only do have one single EBC7700 at hand while waiting for further hardware to arrive.

Thanks!

[1] https://github.com/riscv/meta-riscv/pull/601
[2] https://github.com/eswincomputing/linux-next/tree/dev/test-upstream-v6.18-rc6

Cheers

Marcel

[snip]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

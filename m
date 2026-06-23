Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O4CzICpUOmr36AcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 11:38:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC6A6B5DDD
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jun 2026 11:38:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=bDC7i9JK;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4838C8F272;
	Tue, 23 Jun 2026 09:38:49 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C882FC7BF8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 09:38:48 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6870ad8072eso739874a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jun 2026 02:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782207528; x=1782812328;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SGC4x0qSqXZMMrxbR1onNL1/9AO9MYtn1caz5Hfjgvs=;
 b=bDC7i9JKIzi5nYu1qVvSEmXEyMZsfNl8Fak28Kai0+SwpHlBXKJ3oX9YLbuCqdWSZq
 Nq7AB1DW27zhi/MHx5jIt1FzqwpzDnccTcQT4eopEZAFR47Bwa454BLf3FA4xSuMRbTo
 dqr0Pb+D5HqSdig3ZGU+bST8mcOKnwCBxZ20X8aJNE0CDv7ksKPKBagUI8M6Qf9MmutK
 Yw4tK091zoTLssqtok53etheAGEY71d/YxMAXmd3+/dj5atXeA0cPEE7/E8MnBbISL9G
 lBX2CgJcabZ8U3ORZqzwvwLXHipTqSMX1gy9Jh+ICrToUL+2TJfYSLdAomW/aivlwCgs
 vVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782207528; x=1782812328;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SGC4x0qSqXZMMrxbR1onNL1/9AO9MYtn1caz5Hfjgvs=;
 b=DslGI8ePCWiFVnCrqK2pOiSZeIMHht+qrhpExlICcy/ccod4kf90EXQVf01U4tALUw
 utt7gerHDOO3ep+5lG8bh2Wn6zK0zBm74Su4J48lHhpH6+12Fxkn9H/+COFhnM9lz/Vo
 jjCHIX6Ibvjs6aq1zTvx38uYNrJYNZUdc4RGXXljJE83gFNkEWaOog3B5k/4LtUUyTi+
 cM6zfX1R8V8C6cWotyFVG7jFsERdn9sJEjZr0g39brb5i8yF6x798mP6BYwAnV2+4KNJ
 35I5AC16VG/gZtaIu9NALmPydeiuHvmffJKKiRdSrmWhEO0Ik+Nj3BwjtgA6sMp9HfuF
 690Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Zhxb9h9hehK2matT2qBTCstDx+S8XkkjEyfrh5lmqUVkJKrLc2UUH3qkqRlA8yDlkvSqsTvN9A393xg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw4i4p0dKW4UoMcKMtsyUcPD6IiCfswkW9AMwmGgIu2mj02zZi1
 Ay8xXHV7A1Xg0md9GGciUxOVfsjcj8vPvAAfu1XgriZgnMpca9+d/hVb
X-Gm-Gg: AfdE7cnT3mGaEUoXztNrsP/HYSJTqJQr2MUeaiZOKNY2uav9ek8kxx4GViOKT0AbvRB
 1UjIDwmoEx//YcbZMvRo/GQYHi5RXI/Tyh1SwNH7qTqcZCUl0GtSqBJcfD21C/rEYU0wRX63KEf
 qSf1XEd10R/XoBAOMzu2lmSdalewBOuGyqs0B4dnzPXI5nPhQWtNYjXV6uTQ/11ln0+n8kmF/37
 aPOCjNNMce25t3hv2/CIbkXS+bTv74v5JiRMNCps2xNza7xx6MCzJlY8w0JCLY60nNEqbWfcN4r
 iv4ATi1DsnuA0GQbrsnk2VnOd/ftIkrT43osreEDY2/2cDLiFk+eRR35tIJHAZJ5HEZnRHUMAz7
 xnpRyavIYFcMUbdiuKeUe5u5ubjGtIpYJ0RWHVUpkT3CPpyIZ+x37w1xC3DMeYPX+57w3ST8mcd
 sX0wl9ETlaTuZLzrEZaq8=
X-Received: by 2002:aa7:d70f:0:b0:68f:9fd9:435a with SMTP id
 4fb4d7f45d1cf-697d46111f2mr1053795a12.17.1782207527831; 
 Tue, 23 Jun 2026 02:38:47 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6977be4b9f6sm4215334a12.22.2026.06.23.02.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2026 02:38:45 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:38:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Joakim Zhang <qiangqing.zhang@nxp.com>
Message-ID: <ajpUIqyVSsWMY30x@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [bug report] net: stmmac: fix dma physical address of
 descriptor when display ring
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.89 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qiangqing.zhang@nxp.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CC6A6B5DDD

Hello Joakim Zhang,

Commit bfaf91ca848e ("net: stmmac: fix dma physical address of
descriptor when display ring") from Feb 25, 2021 (linux-next), leads
to the following Smatch static checker warning:

	drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:431 dwmac4_display_ring()
	warn: duplicate check 'desc_size == 32' (previous on line 418)

drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
    399 static void dwmac4_display_ring(void *head, unsigned int size, bool rx,
    400                                 dma_addr_t dma_rx_phy, unsigned int desc_size)
    401 {
    402         dma_addr_t dma_addr;
    403         int i;
    404 
    405         pr_info("%s descriptor ring:\n", rx ? "RX" : "TX");
    406 
    407         if (desc_size == sizeof(struct dma_desc)) {
    408                 struct dma_desc *p = (struct dma_desc *)head;
    409 
    410                 for (i = 0; i < size; i++) {
    411                         dma_addr = dma_rx_phy + i * sizeof(*p);
    412                         pr_info("%03d [%pad]: 0x%x 0x%x 0x%x 0x%x\n",
    413                                 i, &dma_addr,
    414                                 le32_to_cpu(p->des0), le32_to_cpu(p->des1),
    415                                 le32_to_cpu(p->des2), le32_to_cpu(p->des3));
    416                         p++;
    417                 }
    418         } else if (desc_size == sizeof(struct dma_extended_desc)) {
    419                 struct dma_extended_desc *extp = (struct dma_extended_desc *)head;
    420 
    421                 for (i = 0; i < size; i++) {
    422                         dma_addr = dma_rx_phy + i * sizeof(*extp);
    423                         pr_info("%03d [%pad]: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
    424                                 i, &dma_addr,
    425                                 le32_to_cpu(extp->basic.des0), le32_to_cpu(extp->basic.des1),
    426                                 le32_to_cpu(extp->basic.des2), le32_to_cpu(extp->basic.des3),
    427                                 le32_to_cpu(extp->des4), le32_to_cpu(extp->des5),
    428                                 le32_to_cpu(extp->des6), le32_to_cpu(extp->des7));
    429                         extp++;
    430                 }
--> 431         } else if (desc_size == sizeof(struct dma_edesc)) {

The dma_extended_desc and dma_edesc structs are the same size but
just the basic info is at the start vs at the end.  This code is
quite old, but I think maybe we changed the Kconfig so now it's showing
up as a static checker warning?

/* Extended descriptor structure (e.g. >= databook 3.50a) */
struct dma_extended_desc {
	struct dma_desc basic;	/* Basic descriptors */
	__le32 des4;	/* Extended Status */
	__le32 des5;	/* Reserved */
	__le32 des6;	/* Tx/Rx Timestamp Low */
	__le32 des7;	/* Tx/Rx Timestamp High */
};

/* Enhanced descriptor for TBS */
struct dma_edesc {
	__le32 des4;
	__le32 des5;
	__le32 des6;
	__le32 des7;
	struct dma_desc basic;
};

    432                 struct dma_edesc *ep = dma_desc_to_edesc(head);
    433 
    434                 for (i = 0; i < size; i++) {
    435                         dma_addr = dma_rx_phy + i * sizeof(*ep);
    436                         pr_info("%03d [%pad]: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
    437                                 i, &dma_addr,
    438                                 le32_to_cpu(ep->des4), le32_to_cpu(ep->des5),
    439                                 le32_to_cpu(ep->des6), le32_to_cpu(ep->des7),
    440                                 le32_to_cpu(ep->basic.des0), le32_to_cpu(ep->basic.des1),
    441                                 le32_to_cpu(ep->basic.des2), le32_to_cpu(ep->basic.des3));
    442                         ep++;
    443                 }
    444         } else {
    445                 pr_err("unsupported descriptor!");
    446         }
    447 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

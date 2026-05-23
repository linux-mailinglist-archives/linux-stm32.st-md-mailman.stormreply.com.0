Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LraWHbzwE2pJHwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 08:48:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A695C6B82
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2026 08:48:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DE9DC8F296;
	Mon, 25 May 2026 06:48:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CED4AC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2026 12:17:29 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45e8a834cc2so4139707f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 May 2026 05:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779538649; x=1780143449;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZctR30iAkvAMcIVBQcObBnywvkvNoGfhA6wr2BzNYfg=;
 b=j8FnpyqvkLa4iKoyHqD8qMcDQZvYTvYNCpJbifxwi0soO6U0fXa4bY9gXWU44iSY91
 FpIHWmkrXo6ofAqyWPDmDaFPYANj2S1EUfYkum9hZtE2lIV7Lhc8DCZ6j3X18TpWcdZ8
 W73JOAkem1R8eZHUVUFnh5Myq5StzKf4jakOViZWRbMTdswsCPDxbnpRk9iyTRa7eIT3
 VpXVBxDhVkpOv62i83BmGQmoJUopmpugqzHyHbG86TicKDz6FNJxOHHuxDoEy0zOXwa/
 o+a4xGaXAYV9j0g9Um+nQs8w0E4EXshatiy8g0FaNCFRCajr0++V1yqBrOzcGq+J8h/H
 kehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779538649; x=1780143449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZctR30iAkvAMcIVBQcObBnywvkvNoGfhA6wr2BzNYfg=;
 b=HLtIjGXEyylx0AsQthyD/u5ifCr17osEzVFj4rZSegAndojoU1P74OLQIuG/JAds/i
 mQ6BzFo3LZRwvCAnQekVmtdTXIXZ1CNIwkL3LRlgt/bX+wBwdsWqyGb4yAOshVJEH1oa
 njO/A67DBjFCqtNV1Kdo2vdtmrAYG43OJeOJPglMoYwKAQguq6S3GKeR6dIDMaTi5iGN
 OGaJTr5Fc8w2HJ1mKyN+Rf5WrnvngHK0lJVmwC/Bz/qOaRRvbTGOXLHjvnHEvvBjudlb
 GiT7HQNJgxaftGYEgvMmGhyyMPuGGUf1Zr3lLtRVbGXGwLMQxmP8jfoNShm7V3GITdDr
 f59g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+DdaSt8BvcAPmp75E0T2BhLEfUo/4L8Yn7U7DT1CDlrPGUevmZcwd/4XfEwrnZXbVa/s41xovT31l76Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCV0u+4tN1oYWM4oTR6DI9YZUCMdvL5yeMBPA2u+1dxLIqWRzE
 12z9Awf2ePg83snjAqZSDFbZcCOK+2YNZJDxuS+TGQbBYO1g+mRz/qkd
X-Gm-Gg: Acq92OGHMTXitK99mxvPxT78nJV3RjsutsLn+q7D72ML2V5i1RsJs1hIsmIAF3Nk1NT
 p8ShqmYJEm6ZGbA1SJ3wNuv6u6qdvG6mKQErsLmWEgXc3mMl1gqSRHeM7mIzpmnyQwQsMhpPDD1
 M7KD+CVB+KQkRMoIlta74nAZ/uZSgQ1ELPXqPFtLfyfVxah7qeGPyyDXPzU1+FquuyRxud3coJH
 AbkdpML5hF0T7iTCZD3AVVcVA7w2AAnliYXR6XCO0oFzN9z2XyoTrrQdHZz5dldkqrDWqD5O5E9
 idky0UE6FeKf6w6NRKx9rluQqisxehutVddn0t9h32YJpxjuzRDQb+YZiuNBYY2skKRv52dSeyG
 rR9X1YmG3UgClpT/eIFOt8GuhTZXKk2+3mqCkzVhF/BFujH5Ts14GNt4itUXYrzyCxjFkoTMBjn
 2GHaILVNYl7zkIGI2jNo6pajE7oEM4iLhovXfYoNfphSo/a8RkqGVK4aG3sw==
X-Received: by 2002:a05:6000:401e:b0:44a:247e:67b1 with SMTP id
 ffacd0b85a97d-45eb36920e5mr12402024f8f.5.1779538648925; 
 Sat, 23 May 2026 05:17:28 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com ([31.215.251.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d5c32esm11326497f8f.26.2026.05.23.05.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2026 05:17:28 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
To: devnull+dev.taqnialabs.gmail.com@kernel.org
Date: Sat, 23 May 2026 12:17:08 +0000
Message-ID: <20260523121708.564-1-dev.taqnialabs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522-stmmac-rx-desc-cleanup-v2-1-76e78eb471e1@gmail.com>
References: <20260522-stmmac-rx-desc-cleanup-v2-1-76e78eb471e1@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2026 06:48:25 +0000
Cc: dev.taqnialabs@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix RX DMA leak on TX
	alloc failure
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[42];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[devtaqnialabs@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:devnull+dev.taqnialabs.gmail.com@kernel.org,m:dev.taqnialabs@gmail.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:devnull@kernel.org,m:devtaqnialabs@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.795];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devtaqnialabs@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dev.taqnialabs.gmail.com,netdev];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 02A695C6B82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
>+	if (ret)
>+		free_dma_rx_desc_resources(priv, dma_conf);
>
> 	return ret;
> }

The sashiko-gemini analysis [1] flagged two issues.

1) Double-free via XDP path:

stmmac_xdp_set_prog() ignores the return of stmmac_xdp_open(), so
if alloc_dma_tx_desc_resources() fails inside that path,
rx_q->buf_pool and rx_q->dma_rx are freed for Rx queues.

The interface stays UP, so a later stmmac_release() calls
free_dma_desc_resources() on the same freed pointers.

Without this patch, the same failure path leaks RX resources
instead. Either way the root cause seems to be stmmac_xdp_set_prog() not
handling errors from stmmac_xdp_open().

The reported issue seems to be valid, but I'm not sure why XDP doesn't handle
a possible error in reinit in the first place.

2) NULL deref on partial queue alloc:

If alloc_dma_rx_desc_resources() fails for queue N,
e.g. rx_q->page_pool = page_pool_create() fails, buf_pool is NULL.
The cleanup free_dma_rx_desc_resources() iterates through all
queues and will hit a NULL pointer deref in:

static void stmmac_free_rx_buffer(struct stmmac_priv *priv,
				  struct stmmac_rx_queue *rx_q,
				  int i)
{
	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];

The same could happen without the patch, and similar risk exists for
rx_q->buf_pool, rx_q->dma_rx, and rx_q->dma_erx which are all freed
without guards in __free_dma_rx_desc_resources().

I can add the necessary NULL guards in __free_dma_rx_desc_resources()
for V3 if necessary.

[1] https://sashiko.dev/#/patchset/20260522-stmmac-rx-desc-cleanup-v2-1-76e78eb471e1@gmail.com

- Abid
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

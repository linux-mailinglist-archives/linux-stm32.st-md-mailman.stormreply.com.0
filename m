Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3s0ZNMZ6FWrmVgcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 12:49:42 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9E05D4639
	for <lists+linux-stm32@lfdr.de>; Tue, 26 May 2026 12:49:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE97BC5A4C5;
	Tue, 26 May 2026 10:49:41 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02A82C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779792579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Xb91WiXPazwge7GQc97YpLKCGyGlIds3mAgEY7YBag=;
 b=B/KO3EmnbtPgeFCmtzcLR0a76nt6JjzfDdCE6/vAGaftpaNTstK8kaLd3G2E5LKOEivGeQ
 WnGP2E7TDbkZ0+agxPudfEvaWJryHQu7Hi3xzOlvga+T8LLNW4/j7Zm1cVJ82GIi/7Mjmq
 5cRBBonsyQStt++L9xR4skkYdkQeQB4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-gn5Z7CzuOqm5BXWEYuOg5Q-1; Tue, 26 May 2026 06:49:36 -0400
X-MC-Unique: gn5Z7CzuOqm5BXWEYuOg5Q-1
X-Mimecast-MFC-AGG-ID: gn5Z7CzuOqm5BXWEYuOg5Q_1779792575
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-45e81291d62so8624536f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2026 03:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779792575; x=1780397375;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Xb91WiXPazwge7GQc97YpLKCGyGlIds3mAgEY7YBag=;
 b=Z3/Jt00918Fhk78q3MUCi5T12wBlSlHU5IUhe5AjvqdDwj36DBIVVORS9kQVDdCila
 5KShPRfkWLC/ZrCosx/4UCnnTXQqjgm/F74EVJ2kMnoAW+c2BtsKImt+f4xYiS0OEyQP
 P8K/zhti0aeCnjXowqoy9/nHaFgub5Wu6hUnAqu/HPB8L+ljY55G07quYw8Ds5BM3ukZ
 gdll5evQdY9bZRZvDzuCi1Wf4BYf8FsK+UdYMmKdkANVMxwWVZI+2hIJrk5lyltx3ewz
 a0B5zI/L9w3pm59fFBFO9Z8JAmQQqHLi6lwQkoDmLLx/W2WxJKajSXieJ+ETZHW4bhhv
 vb/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9wD/CW176f0M27Kx/yoPn7wpTzEGgQXsNqB90vep0N20NxgeG6VtMycM9Tev4OAJQOujbI0nDE4gWCTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxbI3J1KA8FvCiuQbp5QAjykQwfNJrBj8eG9BBVb0faP9WbNhoC
 NSbkkdIEhUlSRowDv1NCZCf0bx4yT1wvEFP/7J2JiBKXg+BCptTiQCa6af3NrELuQ6Zo2zd4w5x
 5/vJhcK7tXJ1SaYEhXU1gDgUtH866be7Hb0FCPkUDMuMBqgm94W5OsPGJvEH27hgXx3PbBggRdQ
 hJub0HLw==
X-Gm-Gg: Acq92OFwB6CwTWaqUPR+K5dTqGI6Wthblegp1HG8h49GAIeoByTCMQDvowIXL++f3HJ
 AILv/hq68G/Tae9qPaXJ6cnONTCsqYI5CLt9JX6s4/iAbWbh/4EYxFZFgCogi9lkBvn0kgzJzGj
 5cMRb3oNTPJ4EeqpIqsExMBbO1BKFhb5sr1iKgfHmir8XDY7Uk7/twTVaZosf0CFYOZ/M78Phre
 U75Gehte2uKTOqC800MafHOCPgG8aUr5K3ABohck0OzihbDqpYGlPAYjwdqeLGYsXrb3OxI9ypj
 vwuIFjYQoNirbWH3tBwUe5AOBRmwuozrLfrjLgJahw/uIDoO7DRFOyDU/L4DOu83JQRZOV+sCWr
 lI9k2jyBZYh8cQfDbmKnWKe0tprpGudlJ7eW2bUwakHUKTTH383CPjd3uJg==
X-Received: by 2002:a05:600c:8b12:b0:490:5191:6e1a with SMTP id
 5b1f17b1804b1-490519170d7mr255826115e9.24.1779792575178; 
 Tue, 26 May 2026 03:49:35 -0700 (PDT)
X-Received: by 2002:a05:600c:8b12:b0:490:5191:6e1a with SMTP id
 5b1f17b1804b1-490519170d7mr255825705e9.24.1779792574774; 
 Tue, 26 May 2026 03:49:34 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.155.152])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904174a145sm148632185e9.0.2026.05.26.03.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 May 2026 03:49:34 -0700 (PDT)
Message-ID: <e86545c6-d647-44c3-be72-5390a211b9d4@redhat.com>
Date: Tue, 26 May 2026 12:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abid Ali <dev.taqnialabs@gmail.com>,
 devnull+dev.taqnialabs.gmail.com@kernel.org
References: <20260522-stmmac-rx-desc-cleanup-v2-1-76e78eb471e1@gmail.com>
 <20260523121708.564-1-dev.taqnialabs@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260523121708.564-1-dev.taqnialabs@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8fWMEYAWbMRxSQAX6LtbGo0Xa8FIQvlDBNiLYKc3o8E_1779792575
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, davem@davemloft.net,
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dev.taqnialabs@gmail.com,m:devnull+dev.taqnialabs.gmail.com@kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:devtaqnialabs@gmail.com,m:devnull@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.828];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dev.taqnialabs.gmail.com,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5F9E05D4639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/23/26 2:17 PM, Abid Ali wrote:
>> 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
>> +	if (ret)
>> +		free_dma_rx_desc_resources(priv, dma_conf);
>>
>> 	return ret;
>> }
> 
> The sashiko-gemini analysis [1] flagged two issues.
> 
> 1) Double-free via XDP path:
> 
> stmmac_xdp_set_prog() ignores the return of stmmac_xdp_open(), so
> if alloc_dma_tx_desc_resources() fails inside that path,
> rx_q->buf_pool and rx_q->dma_rx are freed for Rx queues.
> 
> The interface stays UP, so a later stmmac_release() calls
> free_dma_desc_resources() on the same freed pointers.
> 
> Without this patch, the same failure path leaks RX resources
> instead. Either way the root cause seems to be stmmac_xdp_set_prog() not
> handling errors from stmmac_xdp_open().
> 
> The reported issue seems to be valid, but I'm not sure why XDP doesn't handle
> a possible error in reinit in the first place.
> 
> 2) NULL deref on partial queue alloc:
> 
> If alloc_dma_rx_desc_resources() fails for queue N,
> e.g. rx_q->page_pool = page_pool_create() fails, buf_pool is NULL.
> The cleanup free_dma_rx_desc_resources() iterates through all
> queues and will hit a NULL pointer deref in:
> 
> static void stmmac_free_rx_buffer(struct stmmac_priv *priv,
> 				  struct stmmac_rx_queue *rx_q,
> 				  int i)
> {
> 	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
> 
> The same could happen without the patch, and similar risk exists for
> rx_q->buf_pool, rx_q->dma_rx, and rx_q->dma_erx which are all freed
> without guards in __free_dma_rx_desc_resources().
> 
> I can add the necessary NULL guards in __free_dma_rx_desc_resources()
> for V3 if necessary.
My take is following: even if the sashiko reported issues are
pre-existing, they are so strictly tied to this code path that it makes
sense to address all of them together (different patches in the same
series).

Also all of the above looks like 'net' material, deserving fixes tag in
each patch.

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

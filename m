Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOYaOOL/+mkOVQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 10:46:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1A94D80EE
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 10:46:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7149DC8F28A;
	Wed,  6 May 2026 08:46:26 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4918C8F28A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 08:46:24 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-c7358a7a8d1so3916693a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778057183; x=1778661983;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUSdR9R631N14alNwqa0GqPMI72JdY9A7cqHTS5tg5U=;
 b=JnLjCfzzAomSVlubypu9IbHFVGIKtnYMcFuen5yMvWj+zFGd4MCeuWOHwToDaqnueP
 2oPf9EvUG9nBbrcb7SwssdtDEIUtsUgzW4qTsi+mbSqRFvjLsQPmDJoUiHAiUAjaCDJH
 evP21vmBTNPY2zl6uR3m9JjkyaMNfqS18VZIk2fOHEfKXd5RVqKUo2itQn9o0As3ml+1
 WWBYjSr8MwwswUie6ucUCmo6tYjlChP8o1O0eQNkjfH1VVyK2hQfi/Mo4tF4GszH89KP
 cR56KiXzHUXGw5WG9aLZpb+8nyppEp7Ujg1z3IsL66A9rityu12LM8UUUsm4a5/HI32h
 dW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778057183; x=1778661983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jUSdR9R631N14alNwqa0GqPMI72JdY9A7cqHTS5tg5U=;
 b=DZxQjDge0+58muliSxLYyzeJ68A5U6pjS4wMYEn43e8IEb2+RHs7hpp8bn6qKDZXJx
 XmQbBhF5fVhM2KkIeM5N4wY/1HNonlLt+M4RUBLpHw57TUQejPoCFQ4gD6xvBPy6jmEA
 zyN46kBbwmsHgfWPE9TU90SqLuHSFrOd+dhQjhhoYrAF0U3yHjVYEUE29vABPFIPYq65
 DGhIZFKfBV2AnP2TIVHu32kyWzAEK5BChvyTm41LcqxkLO3dkV7Z02v2KPXAGpTf01Cl
 4zL/SK+kj0tMTTB7Lf7A3voSXs7x6jN3v+xypU+Ic2zYbDsFx+o+83QwnQC7nscTnga7
 Gsxw==
X-Forwarded-Encrypted: i=1;
 AFNElJ83jCoH93Ul/jOVWvudC4Gaxfrqmej5e+HmIKL3jLLM2xWBTmYp3UYOACmOfyK8dS7CYhQmKZl43il6tg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxUOqDBBmpgS/gTm+csHFOB8Q242cxzm16CJE+dSuHM7gedFGvi
 /BOniE8mMs+IEAsKSdrhLbh6Zy0FKSAZcsoIKJanaPYUrFFub5bUClBR
X-Gm-Gg: AeBDiesWteYrn9cUDXJx7fL77mGs3iXJGTz1PjGUg/Zdm+b5pGba6y2oaxLc2UV7KGe
 fOddbfIGrsp1Yq1WaTJ+8MvSCGg2vLQt+EJ9acuCLFjiEra9t4n+aClDEOETwpogQlqO2cMgJoa
 K3enef7E7LcI92d3UXujcNaC5nO1CHBj1+h9vCN0KK9bIw9Ldm7qXpTjFjvqVh7n3fyYGL/gjVp
 avDf03mNdSGrJ3ZRoZKW9JfV1Gqi9/jCPF9lB2Fz8YM3qXeyaN8DDn8wdPgHX6JrYKU5sMjtJDf
 eDAXzhr84w/UOxIcaxdKdx5ql+Tu3ac88A6qv47w9aDOurJeK6SA+Wb+/XivSVWv4ylT2tsP+jv
 f/EDCsA8uuuNpq3jKTgXKQGlC/QdwWJF9VKRAw+9PkCeYj7HyPibuzyrvEuXo7836TDHQdT998+
 6Ly21QTAohtd6jXsYfRQ2HOo8Tq/OwplpuV1VK8szYs9kh2/o+SXj4OPgYnz1a2DCfvSLjrTeFf
 wAA4VAFll67pEYLglQB21M=
X-Received: by 2002:a17:902:f650:b0:2b9:87e0:1f80 with SMTP id
 d9443c01a7336-2ba79c2301dmr26131495ad.24.1778057183288; 
 Wed, 06 May 2026 01:46:23 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ba7bf2d72dsm18985145ad.25.2026.05.06.01.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 01:46:22 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com
Date: Wed,  6 May 2026 16:46:13 +0800
Message-ID: <20260506084614.192894-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506084614.192894-1-a0987203069@gmail.com>
References: <20260506084614.192894-1-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Joey Lu <a0987203069@gmail.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 1/1] net: stmmac: dwmac-nuvoton: fix NULL
	pointer dereference in nvt_set_phy_intf_sel()
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
X-Rspamd-Queue-Id: AD1A94D80EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:a0987203069@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.864];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]

priv->dev was never initialized after devm_kzalloc() allocates the
private data structure. When nvt_set_phy_intf_sel() is later invoked
via the phylink interface_select callback, it calls
nvt_gmac_get_delay(priv->dev, ...) which dereferences the NULL pointer.

Fix this by assigning priv->dev = dev immediately after allocation.

Fixes: 4d7c557f58ef ("net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
index e2240b68ad98..2ab6ecac6422 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
@@ -100,6 +100,8 @@ static int nvt_gmac_probe(struct platform_device *pdev)
 	if (!priv)
 		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
 
+	priv->dev = dev;
+
 	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
 							    1, &priv->macid);
 	if (IS_ERR(priv->regmap))
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

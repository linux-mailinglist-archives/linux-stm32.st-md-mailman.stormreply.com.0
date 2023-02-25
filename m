Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0106A3B9E
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Feb 2023 08:17:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D26CCC6A600;
	Mon, 27 Feb 2023 07:17:23 +0000 (UTC)
Received: from mail.nfschina.com (unknown [42.101.60.237])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33F17C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 25 Feb 2023 02:26:49 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 4D51F1A00AB6;
 Sat, 25 Feb 2023 10:27:29 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2tf31PPdTLl; Sat, 25 Feb 2023 10:27:28 +0800 (CST)
Received: from localhost.localdomain (unknown [111.193.131.207])
 (Authenticated sender: kunyu@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 3BD691A00AB3;
 Sat, 25 Feb 2023 10:27:28 +0800 (CST)
From: Li kunyu <kunyu@nfschina.com>
To: linus.walleij@linaro.org
Date: Sat, 25 Feb 2023 10:26:26 +0800
Message-Id: <20230225022627.8275-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <CACRpkdZe3cMMxJesD0mpqHTwvuWHjSGVHsiFUQQyuA+VWknMTQ@mail.gmail.com>
References: <CACRpkdZe3cMMxJesD0mpqHTwvuWHjSGVHsiFUQQyuA+VWknMTQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Feb 2023 07:17:23 +0000
Cc: herbert@gondor.apana.org.au, kunyu@nfschina.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v2 PATCH] crypto: stm32 - Save and restore
	between each request
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


hello senior:
    I understand the new patch and probably know where to add these two functions.
 
> +static int stm32_hash_one_request(struct crypto_engine *engine, void *areq)

+	if (rctx->flags & HASH_FLAGS_INIT) {
+		u32 *preg = rctx->hw_context;
+		u32 reg;
+		int i;
+
+		if (!hdev->pdata->ux500)
+			stm32_hash_write(hdev, HASH_IMR, *preg++);
+		stm32_hash_write(hdev, HASH_STR, *preg++);
+		stm32_hash_write(hdev, HASH_CR, *preg);
+		reg = *preg++ | HASH_CR_INIT;
+		stm32_hash_write(hdev, HASH_CR, reg);
+
+		for (i = 0; i < HASH_CSR_REGISTER_NUMBER; i++)
+			stm32_hash_write(hdev, HASH_CSR(i), *preg++);
+
+		hdev->flags |= HASH_FLAGS_INIT;
-------------------------------------------------------------
Add functions:
		pm_runtime_mark_last_busy(hdev->dev);
        	pm_runtime_put_autosuspend(hdev->dev);
-------------------------------------------------------------
+	}
+

There is another place:

> @@ -442,6 +441,18 @@ static int stm32_hash_update_cpu(struct stm32_hash_dev *hdev)
 			hdev->flags |= HASH_FLAGS_OUTPUT_READY;
 			err = 0;
 		}
+	} else {
+		u32 *preg = rctx->hw_context;
+		int i;
+
+		if (!hdev->pdata->ux500)
+			*preg++ = stm32_hash_read(hdev, HASH_IMR);
+		*preg++ = stm32_hash_read(hdev, HASH_STR);
+		*preg++ = stm32_hash_read(hdev, HASH_CR);
+		for (i = 0; i < HASH_CSR_REGISTER_NUMBER; i++)
+			*preg++ = stm32_hash_read(hdev, HASH_CSR(i));
+
+		rctx->flags |= HASH_FLAGS_INIT;
-------------------------------------------------------------
Add functions:
		pm_runtime_mark_last_busy(hdev->dev);
        	pm_runtime_put_autosuspend(hdev->dev);
-------------------------------------------------------------
 	}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

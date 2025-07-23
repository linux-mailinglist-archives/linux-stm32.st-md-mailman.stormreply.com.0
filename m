Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADC6B0F527
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 16:23:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE198C36B3F;
	Wed, 23 Jul 2025 14:23:44 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBC12C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 14:23:43 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-23c8f179e1bso68520805ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 07:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753280622; x=1753885422;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KOntRSgVHCcFNpsuQ/f1gCdqRlv/yon0haOEPks1Dwc=;
 b=I+o/FH58puODtCzigJMPgUj15s7v2JPZP+vAsEe7X2qZzFWOiDNL5LetV4mp/MdUjW
 SQfb707U9qFHVkoR4l4dB/u/+z10shAUFxOICKDBC+X3kszXeVtati+YRgcLRfHQeLA4
 XBMCaVXOlIFGhwFSbdeJLHggDrHM+VozJSwdHD3850sinHY2t1Y+Jkp35qrqSHk2A2iQ
 srkGkRzu01kXzRr4N4tiYJHAam66DkqLfaHspc4y0khMGJWE6Iu94z7cxEnW9WfYgoxN
 i1BdmMClQE4Qyh/uZVZMqGEIRQ49Jcvj86zSCecA6YJoZc9CXUDQPdK2kCMCottqAUCF
 vRVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753280622; x=1753885422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KOntRSgVHCcFNpsuQ/f1gCdqRlv/yon0haOEPks1Dwc=;
 b=Jq8gJbG6Fg9v2dG0SGk4Ct67oVXEYWn1uGSCOSRKh1twoY9V6YZtkrFeO37hkwTayT
 pdq266JXUbZYxT2SwlqtcJvNWsT/iMHojzzICFm4f6qga+KkiKd9ZxNpkKN1Ki5kYLnQ
 t25M7sw2hXNm0XmYjmhG0f2FuDaBTpUj7jeLZ6WvMYcjA9+0qEQhThynwBUYZ+xn1Xd2
 bOQAd0TF19XZ3JXBEs/6tLYTcyqsl77ea4Bv1UC9iQrO/L7rFkw1onEIUd4J9MMZzRRq
 h2pHNzAzJAVnRLT270Mn5IUbId0tfjborJ/k41cHbdxYRT+F4zxPvUXVebUi0sdDzWgc
 iGsw==
X-Gm-Message-State: AOJu0YyLLeU4xvQDbwWT9FcNgyqxOBmw8VKXQhP9T6goXsZibgy8xAF0
 jI0bTwrCOy/6Kwwg/Jjx9gVB67a1dUk6q9CK7jvTmkNJoQFQ+Agt3F3b
X-Gm-Gg: ASbGncsBbc0PSLCiTQ4HUP01Cwt4hgGSzhBl4MEwhSFjtHqbCfWKr7bpRibim0t+i4m
 r57hJwommO7vVk9omk1C4DAKJi+Qd/eESGaRDWyp/L1IaAV/zBJ17E3xwu1ttcXs3rpahr6B890
 qgrXNixsRGjrXiAf71CveG3oMPPwD7/e+fAdD4TN75Q7H2biYu4nHA55qtqSokKVh53geg3OBl+
 ksPXKZ2FafAxscYGBNdvTCDWL2ZEg6Z8nlryFUnTnt/wridMMeevxQQDHhe1ceFt8MtmlTGAKlB
 KJ2Y3RA9CuqlX0kvSLpApmu4N+Nx9i00zZ/HkkV+1OB9fnCWFk/TSYK77h/JbNiRQPgqzVZUPTp
 7ZiHyw1aDBXC/5CmFUHuUt/8xqQRulEdJYEkM+gJpSOG4rCIf1YtKwnizkec=
X-Google-Smtp-Source: AGHT+IEMb3cIE20x0EQZMiLUrQDv3ie1esxuOFn0TXUcPb/jILtixQh8nGa/Jmj0cICBmpX2znYZ0A==
X-Received: by 2002:a17:902:f707:b0:235:c781:c305 with SMTP id
 d9443c01a7336-23f981932f0mr50241695ad.24.1753280622164; 
 Wed, 23 Jul 2025 07:23:42 -0700 (PDT)
Received: from KERNELXING-MC1.tencent.com ([111.201.28.60])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4a9esm97929595ad.93.2025.07.23.07.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 07:23:41 -0700 (PDT)
From: Jason Xing <kerneljasonxing@gmail.com>
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bjorn@kernel.org,
 magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
 jonathan.lemon@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Date: Wed, 23 Jul 2025 22:23:26 +0800
Message-Id: <20250723142327.85187-2-kerneljasonxing@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250723142327.85187-1-kerneljasonxing@gmail.com>
References: <20250723142327.85187-1-kerneljasonxing@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jason Xing <kernelxing@tencent.com>
Subject: [Linux-stm32] [PATCH net v3 1/2] stmmac: xsk: fix negative overflow
	of budget in zerocopy mode
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

From: Jason Xing <kernelxing@tencent.com>

A negative overflow can happen when the budget number of descs are
consumed. as long as the budget is decreased to zero, it will again go
into while (budget-- > 0) statement and get decreased by one, so the
overflow issue can happen. It will lead to returning true whereas the
expected value should be false.

In this case where all the budget is used up, it means zc function
should return false to let the poll run again because normally we
might have more data to process. Without this patch, zc function would
return true instead.

Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
Signed-off-by: Jason Xing <kernelxing@tencent.com>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
v3
Link: https://lore.kernel.org/all/CAL+tcoAnB+8ZLPyWQ3XsvWTa=JO1yCKWvrKVp+2WCP=kGpfSPg@mail.gmail.com/
1. collect reviewed-by tag
2. replace 'underflow' with 'negative overflow' in a technical way.

v2
Link: https://lore.kernel.org/all/20250721083343.16482-1-kerneljasonxing@gmail.com/
1. target net tree instead of net-next
2. revise commit message
3. use for loop to replace while loop
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f350a6662880..f1abf4242cd2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2596,7 +2596,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 	budget = min(budget, stmmac_tx_avail(priv, queue));
 
-	while (budget-- > 0) {
+	for (; budget > 0; budget--) {
 		struct stmmac_metadata_request meta_req;
 		struct xsk_tx_metadata *meta = NULL;
 		dma_addr_t dma_addr;
-- 
2.41.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

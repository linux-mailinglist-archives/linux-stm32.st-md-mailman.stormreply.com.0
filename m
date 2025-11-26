Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 457D0C8CFA3
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Nov 2025 08:01:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E917BC5A4CA;
	Thu, 27 Nov 2025 07:01:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6995AC58D79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Nov 2025 10:46:13 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-37a56a475e8so60582721fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Nov 2025 02:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bell-sw-com.20230601.gappssmtp.com; s=20230601; t=1764153972; x=1764758772;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ujz+iQZ3aq/Eu2hONyHsL8Ecg6vhJZ81zHq90HSGIsI=;
 b=Cp0tp0otrEa9bzTdqlVl7Q4hPlLZk9GxbDvwDRkSwtNvIi4ByBEmDcEXIabRCABwwF
 xgZPWSbwH0I5oXoh+46Ob/r8He59DoutVpDKhAj3zhPDlFYL71sxI7gerTdP01uefqMh
 n9YdSU9q6HlDwVOoDZWkoIswOnGJaFmsLRPNXqxJBiuseSrpbr95otptii9o7KUqvuT3
 spM9POS5lAbVd54nrRLa4nVpUTYLwSHW/bLRBc43e11sGtpecIr2rp4Axs8sCKtSSTVC
 HS+6P4ih4Kp7ctEqnd30KdEjOrop6u3dR8f0AZ3mZRbeF5qbxyi7FJUnNtHkwA44T4vd
 XMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764153972; x=1764758772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ujz+iQZ3aq/Eu2hONyHsL8Ecg6vhJZ81zHq90HSGIsI=;
 b=eqGH6Iqapv4jIZMxQa9JnRKrHjXCYOnj8BnVaxY0oqa6TGPTo7Pvqsx+qd0B6kko3E
 PfbnpA3BaQIcR9Z78w0dt20j+3boGw3aV6Uak0VP01UjalW4RpDjugQbCqMni2gl1Ole
 u5hfcIpoaZTelzFI3Uwo5BHiWL4wEXrPejzmBFdNQWO4FTlzhqMBDY2wRR280fCMK1wZ
 hYOpBKldgtvlffl0f5orH6oWTzGqB78LBIYFzHqlTZnl+OjPbqj6ex52lK85rKZVFPDE
 t3s1gU1KGItytA/LbT3KszY3ZNuosivOk2JSTUglXOUpFW1kuIBSkI9WOyQ7ll++btSs
 txNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIMUlbkymzOOgLoYz1Q+VvcPw2Mzlp9O5jomWPDWMkL+uD2gseuQitFGGlzA6zX0J/SdVox2goZOJZVw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwGeryA2Q9IcIFOH27yjWDiYlpuLlrlVpXDdknHZnuj7IHIeTxA
 23noKTmntjBUOQrG4usvfjRmmOt5KAHxkO+zaXui+Foy+8BAtfOgCotKV6yszlH6mg==
X-Gm-Gg: ASbGncvRTRzx6Hn2/fkh7dBeIMvI/bIjNN3RPogkcyGNIRrJsOUWbbNyTWH4d0ofXFr
 DFlOMcpb1t1dvPu4V90WC9F7RsYKhqsQVBDMW3CeMo11KiyMna6U2otWko0VeE4OXH64lBpCNdy
 d8IAbjGrk0dqsm1u8/teeHrgbwWT+bKlZXa75AUv8RC91IwSmG3FLvIDpN48XWqA8H/mRCpSn+s
 oNn6sR5hGE8DAlCypXJMTys8SW7B9B3SvhPlvPRVOrCyDnOamkO+fMWyeajm073ufoOouS0WdPX
 YfA+mHWAuyWCceZiq48ryU7mnFUlT8E+9+o/9JJCcngEhREagi25avvfso5D5HlsB47r9GXWMp9
 dPpxjaa0p73tRqP95oZJahFwKR3s76uvsfdwuLYJIxZRNb88m8uvFOhe38NOIr3KD8oxECZK4Z/
 8C3vrZ8QOJaMyVLjkJ+nCqar+WGKjv6jnQ1D935A==
X-Google-Smtp-Source: AGHT+IHV4NJoDgpYQn/p/OIs9fXgEtrHCXvixk5XgByH3mJPfB4RceqYh5UKXpB1J5NvcM+BGdDNkA==
X-Received: by 2002:a2e:9215:0:b0:37b:9a1d:dee3 with SMTP id
 38308e7fff4ca-37cd91a992fmr45052241fa.16.1764153972348; 
 Wed, 26 Nov 2025 02:46:12 -0800 (PST)
Received: from localhost.localdomain ([5.8.36.109])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37cc6b59f01sm37275861fa.17.2025.11.26.02.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 02:46:11 -0800 (PST)
From: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
To: netdev@vger.kernel.org
Date: Wed, 26 Nov 2025 10:43:27 +0000
Message-Id: <20251126104327.175590-1-aleksei.kodanev@bell-sw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 27 Nov 2025 07:01:11 +0000
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Piotr Raczynski <piotr.raczynski@intel.com>,
 linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: fix rx limit check in
	stmmac_rx_zc()
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

The extra "count >= limit" check in stmmac_rx_zc() is redundant and
has no effect because the value of "count" doesn't change after the
while condition at this point.

However, it can change after "read_again:" label:

        while (count < limit) {
            ...

            if (count >= limit)
                break;
    read_again:
            ...
            /* XSK pool expects RX frame 1:1 mapped to XSK buffer */
            if (likely(status & rx_not_ls)) {
                xsk_buff_free(buf->xdp);
                buf->xdp = NULL;
                dirty++;
                count++;
                goto read_again;
            }
            ...

This patch addresses the same issue previously resolved in stmmac_rx()
by commit fa02de9e7588 ("net: stmmac: fix rx budget limit check").
The fix is the same: move the check after the label to ensure that it
bounds the goto loop.

Detected using the static analysis tool - Svace.
Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
---

After creating the patch, I also found the previous attempt to fix this issue
from 2023, but I'm not sure what went wrong or why it wasn't applied:
https://lore.kernel.org/netdev/ZBRd2HyZdz52eXyz@nimitz/

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b90ecd3a55e..86e912471dea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5258,10 +5258,10 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 			len = 0;
 		}
 
+read_again:
 		if (count >= limit)
 			break;
 
-read_again:
 		buf1_len = 0;
 		entry = next_entry;
 		buf = &rx_q->buf_pool[entry];
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

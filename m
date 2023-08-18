Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4952F784758
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Aug 2023 18:26:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FFDBC71291;
	Tue, 22 Aug 2023 16:26:16 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BBFB4C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 10:29:02 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so1117255e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692354542; x=1692959342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z9lhOsL9u2m/0CCpIqf7Y1Re49YhKns/kxGsCRmuFFg=;
 b=Nk6lY/sji1554KDrGzAZ+vjyXmGCo042ElgTPya1gKwgEeUMJIcdq/wL5qfJOk4V6r
 QpUtBXig489jzJ+hQHTfCcgZU7XF9+yuaQMzyuQk8iZDjOikQiIfZPwoK0Wg/COQrxl9
 tst75NqToCwol8oi2fiM6+jxiNJKAd1RLZH3SeN+pBuIuKH/WuKDnSXySgnPRpO5W/nb
 PPFXaNQ0Lf/DUU/JfkmOr6zu49ydwb49B3UEb+1l9Tdp03W7hGXDylEcrHtOjmw/+PJj
 v6/iWoWcPIdSZfJBq2lglvRE39FwKzxVyKCNINBSk3RSKBjQ8EqABkiisBSTpwTrZ7hk
 QKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692354542; x=1692959342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z9lhOsL9u2m/0CCpIqf7Y1Re49YhKns/kxGsCRmuFFg=;
 b=BMWbUuT9DgrHDmsXeiqG9awd2rMwKheTQtl+p9drNj/IJEgB1cs7jPBKWpOa9FVq/g
 wN5oKT1xXF59wNdxOHoVSpCBT7umkfMTD7XZY9qZPlEBpHQbKTnnjMjNkBfdymRnhLIR
 13F+PpvL+un5kv88A+lMap/Slz7JbRX9xz1lrejDgDE+xLHCeszI4ZJzGQI/Si2w9kVP
 FNW+zq2oxU/9LPKCBrEkZMv7sQhzd9cLm7oXOhhhQMz1igyu9dVnyoS4u94edD4rydwr
 877CqkST61okwdyMhLt7N2Zr+HX1xpSz3OdUvhopzNbYev4x3X3x5cqIn5Y0VkwczOWF
 5UyQ==
X-Gm-Message-State: AOJu0Yy3j5YQQ3c6CB13G2hS3Lr/zf+Z+dT4aVgt4kjGmWzzoyog1YJ4
 JK+VsuyvUyD1/oNrFbHPEGM/RA==
X-Google-Smtp-Source: AGHT+IF40zslK9J+qU/URMrIBd2SvGHNIaxIqpROmnBlnsAtbhU8eCxr4zTdpXbQVvv4xnV2w+38qw==
X-Received: by 2002:a05:6512:3613:b0:4fe:347c:874b with SMTP id
 f19-20020a056512361300b004fe347c874bmr1333211lfs.8.1692354541864; 
 Fri, 18 Aug 2023 03:29:01 -0700 (PDT)
Received: from 1.. ([79.115.63.195]) by smtp.gmail.com with ESMTPSA id
 h6-20020a1ccc06000000b003fe8b249df1sm2338909wmb.41.2023.08.18.03.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 03:29:01 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Li Zetao <lizetao1@huawei.com>
Date: Fri, 18 Aug 2023 13:28:15 +0300
Message-Id: <169235440227.51486.16999366988462758608.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818074642.308166-1-lizetao1@huawei.com>
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031;
 i=tudor.ambarus@linaro.org; h=from:subject:message-id;
 bh=qpBLrC/ilH/3fBZL7I10FOtEch8tT5TWABqedTkdJLw=;
 b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBk30e9B36HHQiy8MTzJoUhZP19kuOAqlZ0xMr5A
 nGWgVSVIACJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZN9HvQAKCRBLVU9HpY0U
 6SA9B/0bzJF2vkTay6CKZ3yxN1Qxor783Yen8TkIj1p7DKify7NmufB/YhIAWBjfBO4GpRl13s1
 CjdOosz5zEZROL6X8tTpfxeSh0ND9LdnrAnUT73t4Zv6LpZfSmi2ACGdM9kOJUDj/ZTBM+5Vpw8
 OwaqfV4pf0E4kSxStDENPPGV7HnolpkQjZhotKlZrd/RaLGKpZFuaVUWI4Va5Xia8dG/MvFoH69
 jLFs6mGZGvoduGY6IeDSwIZT8c5gf8WhwlIqvXsLbhvF4ep9M6Y/VJTrx6ENfbLPoIYhkdDVILi
 eIdzLGW6/Qtz25I001dRDfNw7EKpXDe4XBsZKwnIrRmkMkAV
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp;
 fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-Mailman-Approved-At: Tue, 22 Aug 2023 16:24:59 +0000
Cc: heiko@sntech.de, geert+renesas@glider.be, stefan@agner.ch,
 paul@crapouillou.net, linux-mtd@lists.infradead.org, jernej.skrabec@gmail.com,
 miquel.raynal@bootlin.com, jinpu.wang@ionos.com,
 linux-stm32@st-md-mailman.stormreply.com, vigneshr@ti.com, robh@kernel.org,
 samuel@sholland.org, richard@nod.at, wens@csie.org,
 christophe.leroy@csgroup.eu, Tudor Ambarus <tudor.ambarus@linaro.org>,
 u.kleine-koenig@pengutronix.de, linux-sunxi@lists.linux.dev, frank.li@vivo.com,
 martin.blumenstingl@googlemail.com, yangyingliang@huawei.com, vz@mleia.com,
 rogerq@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, philmd@linaro.org,
 dmitry.torokhov@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 mcoquelin.stm32@gmail.com, pratyush@kernel.org
Subject: [Linux-stm32] (subset) [PATCH -next v2 00/12] mtd: Use
	devm_clk_get_*() helper function to simplify the drivers.
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

On Fri, 18 Aug 2023 15:46:30 +0800, Li Zetao wrote:
> Commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks") provides a new helper function for prepared and
> enabled clocks when a driver keeps a clock prepared (or enabled) during
> the whole lifetime of the driver. So where drivers get clocks and enable
> them immediately, it can be combined into a single function
> devm_clk_get_*(). Moreover, the unprepare and disable function
> has been registered to devm_clk_state, and before devm_clk_state is
> released, the clocks will be unprepareed and disable, so it is unnecessary
> to unprepare and disable clock explicitly when remove drivers or in the
> error handling path.
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[11/12] mtd: spi-nor: nxp-spifi: Use helper function devm_clk_get_enabled()
        https://git.kernel.org/mtd/c/69d50d0461a1

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

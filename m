Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAF4476676
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Dec 2021 00:25:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83968C5E2C5;
	Wed, 15 Dec 2021 23:25:18 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41EBEC0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 23:25:16 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id w24so5187872ply.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Dec 2021 15:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vDUcxi+1vGmZblRbJ1Sm9A93/BTFWuWvpCJG8LRDqkk=;
 b=DXYPMTYBbhpvhrxDXuuENJokIN1C4FOkTY68o9ZdjY2X0pGgYoeO8rgMJaLTIsJsrs
 hmhV7bxWtULdRgZPqxLDrtgFNOXSv0KV8oWxGpMGFNLqSmTy7fmcHkQ1kpl4yEeKFaCQ
 UoJ3WJjaqxJiystBa+XimfZjMEBdQR3ZC1UQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vDUcxi+1vGmZblRbJ1Sm9A93/BTFWuWvpCJG8LRDqkk=;
 b=MtUGiwYCZmb2IiwuKjlGzllmPSUAFkEx+ziRAjlcPBldR8wFyamRpNao+2vX1axgI9
 gMntpNnavSfr7njpLi89W7qgrqH58mrvp4dwL38/2SyIMTa17NOcWuT6z0VTWZ8oKqj2
 8QQiw78YRPINlr4F3b8UMOncChyoMjFQsvt8r4qdQt5bdkiQLOpec884kYirRgpIILu+
 HTPyI5Ca2jT/a1j74RavGQkg1ELrISvorlB2f9YViYUUg7+ya+aKYSya3Lb9y7tGUIY4
 TMoaIbRkrnHWLiRH2ha5IwxRFs6G1PJuqQBaxfIhHXrQ0tiAC6u5imNpkyxM8EdmPZ/c
 inlw==
X-Gm-Message-State: AOAM531q2vHndc5v5Idj3Y4Eo3dOblwNp1sCRsK9rzltgxjxj4O7l4pm
 cKAfeB/m0oG3FHFkoX5NCXN/ZA==
X-Google-Smtp-Source: ABdhPJy5py/792S478eMSZrNlgV3972pgHifUoF5SICCwYNK+P2sBeyjHIvi7Ls6eSNJ7zV9Rq3Hlg==
X-Received: by 2002:a17:902:b712:b0:143:72b7:4096 with SMTP id
 d18-20020a170902b71200b0014372b74096mr13995974pls.25.1639610714881; 
 Wed, 15 Dec 2021 15:25:14 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b18sm3120925pjo.31.2021.12.15.15.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 15:25:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Date: Wed, 15 Dec 2021 15:25:13 -0800
Message-Id: <20211215232513.2070158-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2545; h=from:subject;
 bh=S+yja+ZH2OmWXK3ijI5wGcAm/sNwDDcR7CmSYgsRQzo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhunlYeGsDYpcqYmqKGq1gspbWZM1i9uJh+lhO3VSQ
 FHREJxSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYbp5WAAKCRCJcvTf3G3AJlBiD/
 9NL3ZLujTHevof7dlDGHJPmKwu+YtML22gc59bhFYHNlrW1bYIyk8TVkzq+kmWec+iWtOk61RpCSXS
 Z0k7OnyjFshW0V/lqBxlh9J5enIY+QUpyTtjZItLHc+peGRRmKU3uDXa8yjTgmYevNLvTHfOipZRzz
 YX5h1sDytZpE3iLSCyn/6iQF51ttub/xD2LyDYPWCVRhJxhfyqNNLqMT9ieTj7XSNP7ho0xpLojXtG
 tYWFm1l7YezgqMr59jAE6fQpMkolVM6/jLRvwm94HRifQWDQlVIJz2D/fE/HI8uMpMN9h/dj3lWqCz
 b4ueQOnKzDV9J1CjKjjZzWHmB+YITuSkqr1zsPTHvccwOfdpBMTwPqh9G2MRm0jUXjYh5wbbdX0RnY
 JVZy4dPkxUArpoQx+Xv4Tfh8F/WXlRyqbV/+GBScF9djq6yabzoTpogdl8ms5SWTD/qQZalMX7vnQS
 b71qchU1Q+2z06VaTVhRZQ/+9b0CpOQNr0Dwnp7anmFBJ+HiWBzxsh5MK6pgbk4EDXUwePl6dA/RyO
 nVDXPwtQGKzNPzhRAFRnnBCAqowSzkQzNAUNtmHVyPfmg5yUjLgG9QlaoTPq/J+G5/qAgZv8HMan4Q
 g/nbEXYvBPu9ipCueVOY3evU+0zo1CFssLloRyC7DBje0O6J/hslJrPUKIfw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Cc: Lars-Peter Clausen <lars@metafoo.de>, Kees Cook <keescook@chromium.org>,
 Yury Norov <yury.norov@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-hardening@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] iio: stmpe-adc: Use correctly sized arguments
	for bit field
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

The find.h APIs are designed to be used only on unsigned long arguments.
This can technically result in a over-read, but it is harmless in this
case. Regardless, fix it to avoid the warning seen under -Warray-bounds,
which we'd like to enable globally:

In file included from ./include/linux/bitmap.h:9,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/x86/include/asm/cpumask.h:5,
                 from ./arch/x86/include/asm/msr.h:11,
                 from ./arch/x86/include/asm/processor.h:22,
                 from ./arch/x86/include/asm/cpufeature.h:5,
                 from ./arch/x86/include/asm/thread_info.h:53,
                 from ./include/linux/thread_info.h:60,
                 from ./arch/x86/include/asm/preempt.h:7,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:55,
                 from ./include/linux/swait.h:7,
                 from ./include/linux/completion.h:12,
                 from drivers/iio/adc/stmpe-adc.c:10:
drivers/iio/adc/stmpe-adc.c: In function 'stmpe_adc_probe':
./include/linux/find.h:98:23: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-Warray-bounds]
   98 |                 val = *addr | ~GENMASK(size - 1, offset);
      |                       ^~~~~
drivers/iio/adc/stmpe-adc.c:258:13: note: while referencing 'norequest_mask'
  258 |         u32 norequest_mask = 0;
      |             ^~~~~~~~~~~~~~

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/iio/adc/stmpe-adc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/stmpe-adc.c b/drivers/iio/adc/stmpe-adc.c
index fba659bfdb40..d2d405388499 100644
--- a/drivers/iio/adc/stmpe-adc.c
+++ b/drivers/iio/adc/stmpe-adc.c
@@ -256,6 +256,7 @@ static int stmpe_adc_probe(struct platform_device *pdev)
 	struct stmpe_adc *info;
 	struct device_node *np;
 	u32 norequest_mask = 0;
+	unsigned long bits;
 	int irq_temp, irq_adc;
 	int num_chan = 0;
 	int i = 0;
@@ -309,8 +310,8 @@ static int stmpe_adc_probe(struct platform_device *pdev)
 
 	of_property_read_u32(np, "st,norequest-mask", &norequest_mask);
 
-	for_each_clear_bit(i, (unsigned long *) &norequest_mask,
-			   (STMPE_ADC_LAST_NR + 1)) {
+	bits = norequest_mask;
+	for_each_clear_bit(i, &bits, (STMPE_ADC_LAST_NR + 1)) {
 		stmpe_adc_voltage_chan(&info->stmpe_adc_iio_channels[num_chan], i);
 		num_chan++;
 	}
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

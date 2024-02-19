Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF9A85ABC2
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 20:08:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B83F8C6B45E;
	Mon, 19 Feb 2024 19:08:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDCEFC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 19:08:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 314B460F36;
 Mon, 19 Feb 2024 19:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE033C433C7;
 Mon, 19 Feb 2024 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708369709;
 bh=Qgm4yRczBnXgjpxAD+i1bsbP2xXCEc56/SoGjrcpzPo=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=atM/CvQ3iM2Anizb1lzybkxvKx4jL0MqzynEc9xfeXYO4jST8XRzcHkXWB1rVSoXm
 QzyUkIxjMCH9R5YY/PaB5tsF3NM1FDm8ykl4d3vXKA5asaVD7k3T/dyEoh1VZZzkjV
 kIr74/S+E61h0sUkZdHfsYrdNzab1k3HMtQZRRFEGMUr+2ET8tOcs0ZuNnfT1ZRisK
 aGWGhy6Ua4SklPFh8q/0UhO+nzJXgQ6wsbcSkaoqa5RFwR1fvwJmxCB+5UNPA+m8me
 VnACdEWHC3NqCsBvhJZUamXJbuuKbNyTaBxaPGys8l0JPiznLYdaSAmdLDp4bqSWW0
 hCsk3eP26kWrw==
Message-ID: <e760847bd911671f1e364271888481fd.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <02461595-16b3-4fea-a029-54190e10e6f5@linaro.org>
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
 <38e7e80f61f7c67c984735cf55c3dfb3.sboyd@kernel.org>
 <02461595-16b3-4fea-a029-54190e10e6f5@linaro.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jaroslav Kysela <perex@perex.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Nishanth Menon <nm@ti.com>,
 Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Shawn Guo <shawnguo@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 patches@opensource.cirrus.com
Date: Mon, 19 Feb 2024 11:08:27 -0800
User-Agent: alot/0.10
Subject: Re: [Linux-stm32] [PATCH] clk: constify the of_phandle_args
	argument of of_clk_provider
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

Quoting Krzysztof Kozlowski (2024-02-15 23:12:29)
> On 16/02/2024 00:12, Stephen Boyd wrote:
> > Quoting Krzysztof Kozlowski (2024-02-08 08:37:10)
> >> None of the implementations of the get() and get_hw() callbacks of
> >> "struct of_clk_provider" modify the contents of received of_phandle_args
> >> pointer.  They treat it as read-only variable used to find the clock to
> >> return.  Make obvious that implementations are not supposed to modify
> >> the of_phandle_args, by making it a pointer to const.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> > 
> > This will almost certainly break the build once it is merged to
> > linux-next. What's your plan to merge this?
> 
> First problem is that it might not apply... I prepared it on next to be
> sure all subsystems are updated.
> 
> The idea is to get reviews and acks and then:
> 1. Maybe it applies cleanly to your tree meaning there will be no
> conflicts with other trees,
> 2. If not, then I can keep rebasing it and it should be applied after rc1.
> 

The struct clk based version is probably not going to be used in any new
code. If you split the patch up and converted the struct clk based ones
first then that would probably apply without breaking anything, because
new code should only be using the struct clk_hw version.

The struct clk_hw version could be done in two steps. Introduce another
get_hw callback with the const signature, and then update the world to
use that callback, finally remove the old callback. We could call this
callback 'get_clk_hw'. This is probably more work than it's worth
though, but at least this way we don't have to worry about applying
after rc1.

Or perhaps we need to cast everything and use macros? It would be bad if
the callback actually did something with the clkspec and we cast it to
const, but your patch shows that nobody is doing that. We would get rid
of this macro garbage once everything is converted.

---8<---
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 2253c154a824..8e5ed16a97a0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4818,7 +4818,7 @@ struct of_clk_provider {
 	struct list_head link;
 
 	struct device_node *node;
-	struct clk *(*get)(struct of_phandle_args *clkspec, void *data);
+	struct clk *(*get)(const struct of_phandle_args *clkspec, void *data);
 	struct clk_hw *(*get_hw)(struct of_phandle_args *clkspec, void *data);
 	void *data;
 };
@@ -4880,8 +4880,8 @@ EXPORT_SYMBOL_GPL(of_clk_hw_onecell_get);
  *
  * This function is *deprecated*. Use of_clk_add_hw_provider() instead.
  */
-int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *clkspec,
+int _of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(const struct of_phandle_args *clkspec,
 						   void *data),
 			void *data)
 {
@@ -4914,7 +4914,7 @@ int of_clk_add_provider(struct device_node *np,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(of_clk_add_provider);
+EXPORT_SYMBOL_GPL(_of_clk_add_provider);
 
 /**
  * of_clk_add_hw_provider() - Register a clock provider for a node
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1293c38ddb7f..bfc660fa7c8f 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1531,10 +1531,11 @@ struct clk_hw_onecell_data {
 	}
 
 #ifdef CONFIG_OF
-int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *args,
+int _of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(const struct of_phandle_args *args,
 						   void *data),
 			void *data);
+
 int of_clk_add_hw_provider(struct device_node *np,
 			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
 						 void *data),
@@ -1559,8 +1560,8 @@ int of_clk_detect_critical(struct device_node *np, int index,
 
 #else /* !CONFIG_OF */
 
-static inline int of_clk_add_provider(struct device_node *np,
-			struct clk *(*clk_src_get)(struct of_phandle_args *args,
+static inline int _of_clk_add_provider(struct device_node *np,
+			struct clk *(*clk_src_get)(const struct of_phandle_args *args,
 						   void *data),
 			void *data)
 {
@@ -1614,6 +1615,12 @@ static inline int of_clk_detect_critical(struct device_node *np, int index,
 }
 #endif /* CONFIG_OF */
 
+typedef struct clk *(*clk_src_get_fn)(const struct of_phandle_args *args, void *data);
+
+#define of_clk_add_provider(np, get, data) ({				\
+		_of_clk_add_provider(np, (clk_src_get_fn)(get), data);		\
+})
+
 void clk_gate_restore_context(struct clk_hw *hw);
 
 #endif /* CLK_PROVIDER_H */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F68A0AFF3
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 08:19:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9331C78F75;
	Mon, 13 Jan 2025 07:19:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6290DC78F69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 09:26:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A7RkRP025601;
 Fri, 10 Jan 2025 10:26:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=fVpk+5d+aUq4dE7U3H7XuMNH
 86mBRUVN3YH6VPCeM5k=; b=wvpugXPIbFoLhm7ZtPsJK1sDkNJFg4JwlAlN7qdH
 8FGcocPbj7lziw6EVb4sKcE4QdZgfwVCclQTEqXM1kOx1urwyvwLB/Ud2MKtX45F
 O2xMdw7QxxnJgFU18ozKVRz85ErtcR6TcRAfQcR2hpAAdJBV+zpXxQRbdibOSjI7
 1IUXp6jNUz49z2HCoZ8SFg5x8qGHrA+XjpFq+6yANRjnPSTrBonE96DAO7mZVocU
 lYwuY3yE0oZPeqUogTsXxr/ytz70Vd8cZiKfQelyUEk9WNsQncwueqoWzB44Q7g1
 TbRkdpf2zkD34muFbbMPh2W3VUuoFnw+DGgUKZcDg5FyiQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 442mw0j9py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2025 10:26:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BDFB840054;
 Fri, 10 Jan 2025 10:24:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E30528A885;
 Fri, 10 Jan 2025 10:22:22 +0100 (CET)
Received: from [10.252.28.181] (10.252.28.181) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 10 Jan
 2025 10:22:21 +0100
Message-ID: <5fec34de-015a-4d89-ad15-d065574193ab@foss.st.com>
Date: Fri, 10 Jan 2025 10:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Nyekjaer <sean@geanix.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Raphael
 Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
X-Originating-IP: [10.252.28.181]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Mailman-Approved-At: Mon, 13 Jan 2025 07:19:29 +0000
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v2 1/3] drm/modes: introduce
 drm_mode_validate_mode() helper function
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
Content-Type: multipart/mixed; boundary="===============4348036192369860293=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============4348036192369860293==
Content-Type: multipart/alternative;
	boundary="------------oTpMEcdj0Z5wCOh9C3Uag3sF"
Content-Language: en-US

--------------oTpMEcdj0Z5wCOh9C3Uag3sF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sean,

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

Thanks for this patch,

Yannick

Le 25/11/2024 à 14:49, Sean Nyekjaer a écrit :
> Check if the required pixel clock is in within .5% range of the
> desired pixel clock.
> This will match the requirement for HDMI where a .5% tolerance is allowed.
>
> Signed-off-by: Sean Nyekjaer<sean@geanix.com>
> ---
>   drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
>   include/drm/drm_modes.h     |  2 ++
>   2 files changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4d977b297f5d5359 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
>   }
>   EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
>   
> +/**
> + * drm_mode_validate_mode
> + * @mode: mode to check
> + * @rounded_rate: output pixel clock
> + *
> + * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
> + * CVT spec reuses that tolerance in its examples, so it looks to be a
> + * good default tolerance for the EDID-based modes. Define it to 5 per
> + * mille to avoid floating point operations.
> + *
> + * Returns:
> + * The mode status
> + */
> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
> +					    unsigned long long rounded_rate)
> +{
> +	enum drm_mode_status status;
> +	unsigned long long rate = mode->clock * 1000;
> +	unsigned long long lowest, highest;
> +
> +	lowest = rate * (1000 - 5);
> +	do_div(lowest, 1000);
> +	if (rounded_rate < lowest)
> +		return MODE_CLOCK_LOW;
> +
> +	highest = rate * (1000 + 5);
> +	do_div(highest, 1000);
> +	if (rounded_rate > highest)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +EXPORT_SYMBOL(drm_mode_validate_mode);
> +
>   static enum drm_mode_status
>   drm_mode_validate_basic(const struct drm_display_mode *mode)
>   {
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index b9bb92e4b0295a5cbe0eb0da13e77449ff04f51d..4b638992f3e50d2aba5088644744457d72dbe10a 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -549,6 +549,8 @@ bool drm_mode_equal_no_clocks(const struct drm_display_mode *mode1,
>   			      const struct drm_display_mode *mode2);
>   bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
>   					const struct drm_display_mode *mode2);
> +enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
> +					    unsigned long long rounded_rate);
>   
>   /* for use by the crtc helper probe functions */
>   enum drm_mode_status drm_mode_validate_driver(struct drm_device *dev,
>
--------------oTpMEcdj0Z5wCOh9C3Uag3sF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre class="moz-quote-pre" wrap="">Hi Sean,

<span style="white-space: normal">Tested-by: Yannick Fertre <a class="moz-txt-link-rfc2396E" href="mailto:yannick.fertre@foss.st.com">&lt;yannick.fertre@foss.st.com&gt;</a> </span></pre>
    <pre class="moz-quote-pre" wrap="">Thanks for this patch,

Yannick

</pre>
    <div class="moz-cite-prefix">Le 25/11/2024 à 14:49, Sean Nyekjaer a
      écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241125-dsi-relax-v2-1-9113419f4a40@geanix.com">
      <pre class="moz-quote-pre" wrap="">Check if the required pixel clock is in within .5% range of the
desired pixel clock.
This will match the requirement for HDMI where a .5% tolerance is allowed.

Signed-off-by: Sean Nyekjaer <a class="moz-txt-link-rfc2396E" href="mailto:sean@geanix.com">&lt;sean@geanix.com&gt;</a>
---
 drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_modes.h     |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4d977b297f5d5359 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
 }
 EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
 
+/**
+ * drm_mode_validate_mode
+ * @mode: mode to check
+ * @rounded_rate: output pixel clock
+ *
+ * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
+ * CVT spec reuses that tolerance in its examples, so it looks to be a
+ * good default tolerance for the EDID-based modes. Define it to 5 per
+ * mille to avoid floating point operations.
+ *
+ * Returns:
+ * The mode status
+ */
+enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
+					    unsigned long long rounded_rate)
+{
+	enum drm_mode_status status;
+	unsigned long long rate = mode-&gt;clock * 1000;
+	unsigned long long lowest, highest;
+
+	lowest = rate * (1000 - 5);
+	do_div(lowest, 1000);
+	if (rounded_rate &lt; lowest)
+		return MODE_CLOCK_LOW;
+
+	highest = rate * (1000 + 5);
+	do_div(highest, 1000);
+	if (rounded_rate &gt; highest)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+EXPORT_SYMBOL(drm_mode_validate_mode);
+
 static enum drm_mode_status
 drm_mode_validate_basic(const struct drm_display_mode *mode)
 {
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index b9bb92e4b0295a5cbe0eb0da13e77449ff04f51d..4b638992f3e50d2aba5088644744457d72dbe10a 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -549,6 +549,8 @@ bool drm_mode_equal_no_clocks(const struct drm_display_mode *mode1,
 			      const struct drm_display_mode *mode2);
 bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
 					const struct drm_display_mode *mode2);
+enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
+					    unsigned long long rounded_rate);
 
 /* for use by the crtc helper probe functions */
 enum drm_mode_status drm_mode_validate_driver(struct drm_device *dev,

</pre>
    </blockquote>
  </body>
</html>

--------------oTpMEcdj0Z5wCOh9C3Uag3sF--

--===============4348036192369860293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============4348036192369860293==--

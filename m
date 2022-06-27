Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579B55B9D2
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jun 2022 15:17:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE581C04004;
	Mon, 27 Jun 2022 13:17:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F8FEC03FC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jun 2022 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656335826; x=1687871826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f4xxEul0YKd5rxrkLyEAwzdVgpps8n1/yZoBsxB6ax4=;
 b=R3D1UimulsU/YLqs81yHkallMejP6x3lK9y14s5vi9Z7MFYjRcwWl0qy
 LpuYMPRRh6PgRH5TM4N+7nmEoWXp2QlGoBIo5Ba6CDXKhbxwFNuY4CkIo
 QjvkaJrmfBpm2hr6/7Kj1HgoWF424y58zk5UKwKfXtfBIRsqr2jiWFUoo
 TGikz15pLV+JOOawci+DxndC0sW138MIsqcSm1cVSg2ttuFprHwl7Hpg4
 yBopnqS1ely97DNgLUDP6ptngnPEnMPHYLSKAFWOGi+/6FiIMF5emeAW6
 /LBYtIiAEEkDUexTVDIFF7SOsOWGdUgIaJ7UeTHhZmQnKMw6y0yXiQAsk Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="278991728"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="278991728"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 06:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="732308958"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 27 Jun 2022 06:17:00 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 27 Jun 2022 16:17:00 +0300
Date: Mon, 27 Jun 2022 16:17:00 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YrmtzDfFm17PFl2r@kuha.fi.intel.com>
References: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
 <20220624155413.399190-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624155413.399190-3-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 2/4] usb: typec: ucsi: stm32g0: add
 support for stm32g0 i2c controller
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

Hi,

On Fri, Jun 24, 2022 at 05:54:11PM +0200, Fabrice Gasnier wrote:
> +static int ucsi_stm32g0_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct ucsi_stm32g0 *g0;
> +	int ret;
> +
> +	g0 = devm_kzalloc(dev, sizeof(*g0), GFP_KERNEL);
> +	if (!g0)
> +		return -ENOMEM;
> +
> +	g0->dev = dev;
> +	g0->client = client;
> +	init_completion(&g0->complete);
> +	i2c_set_clientdata(client, g0);
> +
> +	g0->ucsi = ucsi_create(dev, &ucsi_stm32g0_ops);
> +	if (IS_ERR(g0->ucsi))
> +		return PTR_ERR(g0->ucsi);
> +
> +	ucsi_set_drvdata(g0->ucsi, g0);
> +
> +	/* Request alert interrupt */
> +	ret = request_threaded_irq(client->irq, NULL, ucsi_stm32g0_irq_handler, IRQF_ONESHOT,
> +				   dev_name(&client->dev), g0);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "request IRQ failed\n");
> +		goto destroy;
> +	}
> +
> +	ret = ucsi_register(g0->ucsi);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "ucsi_register failed\n");
> +		goto freeirq;
> +	}

If there isn't UCSI firmware, then ucsi_register() will always safely
fail here, right?


> +	return 0;
> +
> +freeirq:
> +	free_irq(client->irq, g0);
> +destroy:
> +	ucsi_destroy(g0->ucsi);
> +
> +	return ret;
> +}


thanks,

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

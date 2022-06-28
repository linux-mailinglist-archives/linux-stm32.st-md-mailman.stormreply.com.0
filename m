Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F2C55BFEE
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 11:56:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A60F4C5F1EE;
	Tue, 28 Jun 2022 09:56:37 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30FEDC035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 09:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656410196; x=1687946196;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=E8g6oATwOn9T0Tp0qEpsI5CmgdS7Yl7GaxAoiXWVZNk=;
 b=XSTIopeFoxS7x38RM+21JkF3y7endnCEOjVVwVBfRrE2XCDbYZntydFA
 qnOmQN4Te0hA/34HKNe8O+BY4LZXyN2KyezJp42ofkLgD5nhYmMIcMyrY
 1B9oAdkPH+t28Abd8pvN48MQIBVzV57PluBfZlbu+mkBKMHkBRnPNxbPS
 A8yXuPREizex5HNlBHNb01WfB3KdQuWVFH4ZgeSdJlGuFj4j4IBixMZtK
 jo6Vu6NMLpEuyDH2A6po7fsM21CsIBIZL8FKY7CVT/7GDfzn6BpUaPH2w
 y2BEJpw5eqEGieOPUhcPYrpRLXqpK2qejBw/0UyijOl881JVfKUFj3A5s g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="281734400"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="281734400"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 02:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="732691163"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 28 Jun 2022 02:56:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 28 Jun 2022 12:56:30 +0300
Date: Tue, 28 Jun 2022 12:56:30 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <YrrQTiCWsnRKAzn7@kuha.fi.intel.com>
References: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
 <20220624155413.399190-3-fabrice.gasnier@foss.st.com>
 <YrmtzDfFm17PFl2r@kuha.fi.intel.com>
 <bd35eb19-cfda-4799-1ab0-0578d3c79466@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd35eb19-cfda-4799-1ab0-0578d3c79466@foss.st.com>
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

On Tue, Jun 28, 2022 at 09:21:12AM +0200, Fabrice Gasnier wrote:
> On 6/27/22 15:17, Heikki Krogerus wrote:
> > Hi,
> > 
> > On Fri, Jun 24, 2022 at 05:54:11PM +0200, Fabrice Gasnier wrote:
> >> +static int ucsi_stm32g0_probe(struct i2c_client *client, const struct i2c_device_id *id)
> >> +{
> >> +	struct device *dev = &client->dev;
> >> +	struct ucsi_stm32g0 *g0;
> >> +	int ret;
> >> +
> >> +	g0 = devm_kzalloc(dev, sizeof(*g0), GFP_KERNEL);
> >> +	if (!g0)
> >> +		return -ENOMEM;
> >> +
> >> +	g0->dev = dev;
> >> +	g0->client = client;
> >> +	init_completion(&g0->complete);
> >> +	i2c_set_clientdata(client, g0);
> >> +
> >> +	g0->ucsi = ucsi_create(dev, &ucsi_stm32g0_ops);
> >> +	if (IS_ERR(g0->ucsi))
> >> +		return PTR_ERR(g0->ucsi);
> >> +
> >> +	ucsi_set_drvdata(g0->ucsi, g0);
> >> +
> >> +	/* Request alert interrupt */
> >> +	ret = request_threaded_irq(client->irq, NULL, ucsi_stm32g0_irq_handler, IRQF_ONESHOT,
> >> +				   dev_name(&client->dev), g0);
> >> +	if (ret) {
> >> +		dev_err_probe(dev, ret, "request IRQ failed\n");
> >> +		goto destroy;
> >> +	}
> >> +
> >> +	ret = ucsi_register(g0->ucsi);
> >> +	if (ret) {
> >> +		dev_err_probe(dev, ret, "ucsi_register failed\n");
> >> +		goto freeirq;
> >> +	}
> > 
> > If there isn't UCSI firmware, then ucsi_register() will always safely
> > fail here, right?
> 
> Hi Heikki,
> 
> Yes, in such a case, the first i2c read (UCSI_VERSION) in
> ucsi_register() will return an error and safely fail here.

Okay, thanks.

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

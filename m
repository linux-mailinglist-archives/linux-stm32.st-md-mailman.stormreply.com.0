Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B7AD0EAEC
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jan 2026 12:27:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A9C5C3F945;
	Sun, 11 Jan 2026 11:27:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACF8FC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jan 2026 11:27:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3074B419AD;
 Sun, 11 Jan 2026 11:27:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460CDC4CEF7;
 Sun, 11 Jan 2026 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768130839;
 bh=stgwO9T5kYysIbbRN1ca+E0wNUENyn/Qu+WwsBXJpXI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=r2LUXGZ2b2o9rfrci+BCMwAXwB6BHbecfKzOwNFQViCrUZGsCASznFmxz1PwkJflz
 g8Z4aMwICvR0CSNtR+OftCy4uaQHzg1fc9gVM7STQvg4PSwttxqbHZ6HiLzsW0Jdxk
 H+GSm7HudV9bjMkphbYErKDV1Y0KwExndOLYCDNcfESopX2qn/Ss7IV04BrI/0IK3P
 wgzfEy9S7BsF9C/jx8mtIOZAB0bTrJBcmVICoYUSZqLxmDeObcRUIyHVREl65cuZY6
 Y10AcauO6nxB6/uG4r8pTp4kH9p5OCfpDjfQYusAwoFixQu7hBFmob3QtkmQHJMcpA
 PvVm8QfGuUIAg==
Message-ID: <429e4411-6372-482b-9a0c-be4befa8f016@kernel.org>
Date: Sun, 11 Jan 2026 12:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/11] drivers: bus: add the stm32 debug
	bus driver
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

On 09/01/2026 11:55, Gatien Chevallier wrote:
> Add the stm32 debug bus driver that is responsible of checking the
> +
> +static int stm32_dbg_bus_grant_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
> +{
> +	struct tee_ioctl_invoke_arg inv_arg = {0};
> +	struct tee_param param[1] = {0};
> +	u32 session_id;
> +	int ret;
> +
> +	if (dbg_profile != PERIPHERAL_DBG_PROFILE && dbg_profile != HDP_DBG_PROFILE)
> +		return -EOPNOTSUPP;
> +
> +	ret = stm32_dbg_pta_open_session(&session_id);
> +	if (ret)
> +		return ret;
> +
> +	inv_arg.func = PTA_CMD_GRANT_DBG_ACCESS;
> +	inv_arg.session = session_id;
> +	inv_arg.num_params = 1;
> +	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
> +	param[0].u.value.a = dbg_profile;
> +
> +	ret = tee_client_invoke_func(stm32_dbg_bus_priv->ctx, &inv_arg, param);
> +	if (ret < 0 || inv_arg.ret != 0) {
> +		dev_dbg(stm32_dbg_bus_priv->dev,
> +			"When invoking function, err %x, TEE returns: %x\n", ret, inv_arg.ret);
> +		if (!ret)
> +			ret = -EACCES;
> +	}
> +
> +	stm32_dbg_pta_close_session(session_id);
> +
> +	return ret;
> +}
> +
> +/* Implement mandatory release_access ops even if it does nothing*/
> +static void stm32_dbg_bus_release_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
> +{
> +}
> +
> +static int stm32_dbg_bus_plat_probe(struct platform_device *pdev)
> +{
> +	struct stm32_firewall_controller *dbg_controller;
> +	int ret;
> +
> +	if (!stm32_dbg_bus_priv)
> +		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
> +				     "OP-TEE debug services not yet available\n");
> +
> +	dbg_controller = devm_kzalloc(&pdev->dev, sizeof(*dbg_controller), GFP_KERNEL);
> +	if (!dbg_controller)
> +		return dev_err_probe(&pdev->dev, -ENOMEM, "Couldn't allocate debug controller\n");
> +
> +	dbg_controller->dev = &pdev->dev;
> +	dbg_controller->mmio = NULL;
> +	dbg_controller->name = dev_driver_string(dbg_controller->dev);
> +	dbg_controller->type = STM32_PERIPHERAL_FIREWALL;
> +	dbg_controller->grant_access = stm32_dbg_bus_grant_access;
> +	dbg_controller->release_access = stm32_dbg_bus_release_access;
> +
> +	stm32_dbg_bus_priv->dbg_clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(stm32_dbg_bus_priv->dbg_clk))
> +		return PTR_ERR(stm32_dbg_bus_priv->dbg_clk);
> +
> +	ret = stm32_firewall_controller_register(dbg_controller);
> +	if (ret) {
> +		dev_err(dbg_controller->dev, "Couldn't register as a firewall controller: %d", ret);
> +		return ret;
> +	}
> +
> +	ret = stm32_firewall_populate_bus(dbg_controller);
> +	if (ret) {
> +		dev_err(dbg_controller->dev, "Couldn't populate debug bus: %d", ret);
> +		stm32_firewall_controller_unregister(dbg_controller);
> +		return ret;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +	if (ret) {
> +		dev_err(dbg_controller->dev, "Couldn't populate the node: %d", ret);
> +		stm32_firewall_controller_unregister(dbg_controller);
> +		return ret;

Where do you depopulate on unbind?

> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused stm32_dbg_bus_runtime_suspend(struct device *dev)
> +{
> +	clk_disable_unprepare(stm32_dbg_bus_priv->dbg_clk);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused stm32_dbg_bus_runtime_resume(struct device *dev)
> +{
> +	int ret = clk_prepare_enable(stm32_dbg_bus_priv->dbg_clk);
> +
> +	if (ret) {
> +		dev_err(dev, "Failed to enable clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id stm32_dbg_bus_of_match[] = {
> +	{ .compatible = "st,stm32mp131-dbg-bus", },
> +	{ .compatible = "st,stm32mp151-dbg-bus", },

So devices are fully compatible?

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, stm32_dbg_bus_of_match);
> +
> +static const struct dev_pm_ops simple_pm_bus_pm_ops = {
> +	SET_RUNTIME_PM_OPS(stm32_dbg_bus_runtime_suspend, stm32_dbg_bus_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +static struct platform_driver stm32_dbg_bus_driver = {
> +	.probe = stm32_dbg_bus_plat_probe,
> +	.driver = {
> +		.name = "stm32-dbg-bus",
> +		.of_match_table = of_match_ptr(stm32_dbg_bus_of_match),

Warning :/. Why do people still keep copying of_match_ptr?

> +		.pm = pm_ptr(&simple_pm_bus_pm_ops),
> +	},
> +};
> +
> +static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
> +{
> +	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
> +}
> +
> +static int stm32_dbg_bus_probe(struct device *dev)
> +{
> +	struct stm32_dbg_bus *priv;
> +
> +	if (stm32_dbg_bus_priv)
> +		return dev_err_probe(dev, -EBUSY,
> +				     "A STM32 debug bus device is already initialized\n");
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return dev_err_probe(dev, -ENOMEM, "Cannot allocate priv data\n");

You NEVER print error allocations on kzalloc, even if with dev_err_probe
it is silenced.

> +
> +	/* Open context with TEE driver */
> +	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
> +	if (IS_ERR_OR_NULL(priv->ctx))
> +		return dev_err_probe(dev, PTR_ERR_OR_ZERO(priv->ctx), "Cannot open TEE context\n");
> +
> +	stm32_dbg_bus_priv = priv;
> +	stm32_dbg_bus_priv->dev = dev;
> +
> +	return 0;
> +}
> +
> +static int stm32_dbg_bus_remove(struct device *dev)
> +{
> +	tee_client_close_context(stm32_dbg_bus_priv->ctx);
> +	stm32_dbg_bus_priv = NULL;
> +
> +	return 0;
> +}
> +
> +static const struct tee_client_device_id optee_dbg_bus_id_table[] = {
> +	{UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
> +		   0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
> +	{}
> +};
> +
> +static struct tee_client_driver stm32_optee_dbg_bus_driver = {
> +	.id_table = optee_dbg_bus_id_table,
> +	.driver = {
> +		.name = "optee_dbg_bus",
> +		.bus = &tee_bus_type,
> +		.probe = stm32_dbg_bus_probe,
> +		.remove = stm32_dbg_bus_remove,
> +	},
> +};
> +
> +static int __init optee_dbg_bus_mod_init(void)
> +{
> +	int ret;
> +
> +	ret = driver_register(&stm32_optee_dbg_bus_driver.driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&stm32_dbg_bus_driver);
> +	if (ret)
> +		driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> +
> +	return ret;
> +}
> +
> +static void __exit optee_dbg_bus_mod_exit(void)
> +{
> +	platform_driver_unregister(&stm32_dbg_bus_driver);
> +	driver_unregister(&stm32_optee_dbg_bus_driver.driver);
> +}
> +
> +module_init(optee_dbg_bus_mod_init);
> +module_exit(optee_dbg_bus_mod_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
> +MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");
> 


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

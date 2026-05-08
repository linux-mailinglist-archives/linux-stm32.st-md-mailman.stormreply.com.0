Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGCENqR+/WnnegAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 08:11:48 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA34F247D
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 08:11:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0080C03FCA;
	Fri,  8 May 2026 06:11:47 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B314C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 06:11:45 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2c15849aa2cso2113587eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2026 23:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778220704; x=1778825504;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jXb0SR/K0dwEQwnGYT+FJTHi8ls55dvpbTwOnKCIOSw=;
 b=RDScFWfgQuH5PvzPDkcIfvLHToIJhxGMcmBV/9jYoguq3UslXZVCWcormA1kHYfIeD
 JYEw7/9Xd12kjiG9w/I9A70Pedvj7wpPm+lQrZ6QCMtGyIFbfocyz+4kx//Qqke+wAfF
 cQZ7uj6VW1duCkJHwpAdowolRE8kdQpDFp8B52XrG3Uya/Lr5lkJ+Su9MVWnA2wYKOyI
 ppvqHEKy4G27w5YbRXX7uNz/hNfF0lG3gdMvsp4BdztmODnAxFcaz3Yp94Z8+mT+pJWi
 sUuX1yfxcFSZTtulLy0o+cwyZV57sBlk/1iQumyG7hZNDwOUEYsO/VjxrOA21euNrsc2
 +8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778220704; x=1778825504;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXb0SR/K0dwEQwnGYT+FJTHi8ls55dvpbTwOnKCIOSw=;
 b=Ga/6gUf/e1GF3VtPkGpzir3GZ5d7JjPL6uraDpZx7xO2oCPyk/w0fSzxkZfYtFtHqp
 x2KG5Ind65pucDUa5Gom9QEoPt3E4gOzPM2O7VINV4U46mAmaIK+7bq7gtk6aBK+DHXZ
 +8B1ZMOPBBHyNeM8kqImpHle3iD6EatGuFc1YQ/iMoQhPPfY+w8+Az3cw4R77sgEzspe
 hswYmkQl9fbg0uZzj4dJmw33chXVBpcOSVfni2wiIR1J6E8Wl3FSwSahlkG4iOjnFCQW
 Lqmfp0FyDhpN96zQT0GgJAOVIAqZFSn6ZMwzx7cxBOFQ2eLMLs7S88fJoGxr8inKbsgi
 mc9Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+A4DtPgnuYW0i9Yra1TK54O7XH4FmSbfB0hy4TT7s40afayx5Lv133qx2euiPUrAoO2b0h6id64Dazzw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOIBhdzFEHs3CzB63rYECwcN1R+m0O5gOCndF9PoJDDOa7qyS8
 nst2h3lyHF47tSXF0ENr2WDohV07PiTJfBOK/fUhmJwxM7kzt6RJkYlP
X-Gm-Gg: Acq92OEg5vyuH29CLsitZBFK+RJI0tPtFe7SJq2PTAOTJr6zNiwR3ASiRQNZPHBr2C6
 gXan0sjYT/vImVCqAlXrrGdZ0tnySP3n/HAprCokk3FDA5I2IdZinOj+LTU6DhXuUD5hck3s3ty
 XjG8tOTuYnsMdM3oJkmQ8zzB3NYsWOLLIV5YgyvRC+gT7o7JJtKC5Y2lHNu9NY/nXc2HmEKBnpp
 o95pq5g6mNAjs9y7f84bfMoJEA/BRoI99llFr6K5cxlg3KztMCb0jcvOgrm/jHMGVjgV1dkLazt
 QdQ1b8lsY2pi+pySoRW4BkLYFu4FdmurLRsTl93CoYj5mbIvjNivJxvK5aWjUzUIIirH7upF/VQ
 MCca0upJfgKVYMhJ7NUXmoUYKWYwUj4rYaOvrPuH8/wiT1tl2UsarvcLMM4dZTMdvVVCGfmjkBw
 Gw4JZVFcfoot5jo5v/GKuzFptpEeHbIbHPjCi9c12vyazmn1D9aOJ1FOb3a7ZKnPduZU/QmvOaA
 M4=
X-Received: by 2002:a05:693c:2b08:b0:2ea:cd38:f921 with SMTP id
 5a478bee46e88-2f54aa78245mr5844784eec.26.1778220703475; 
 Thu, 07 May 2026 23:11:43 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:852e:ebf3:8de1:32e1])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2f888e3e285sm1132502eec.27.2026.05.07.23.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 23:11:42 -0700 (PDT)
Date: Thu, 7 May 2026 23:11:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Message-ID: <af13d0-zM8Qjtjcj@google.com>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
 <20260409-stmfts5-v4-10-64fe62027db5@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-10-64fe62027db5@ixit.cz>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Petr Hodina <petr.hodina@protonmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 10/11] Input: stmfts - support FTS5
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
X-Rspamd-Queue-Id: 83CA34F247D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:rydberg@bitmath.org,m:krzk@kernel.org,m:linux-kernel@vger.kernel.org,m:petr.hodina@protonmail.com,m:mcoquelin.stm32@gmail.com,m:linux-input@vger.kernel.org,m:krzk+dt@kernel.org,m:phone-devel@vger.kernel.org,m:konradybcio@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.860];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,bitmath.org,protonmail.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

Hi David,

On Thu, Apr 09, 2026 at 12:15:53AM +0200, David Heidelberg via B4 Relay wrote:
> @@ -101,12 +129,27 @@ struct stmfts_data {
>  
>  	struct completion cmd_done;
>  
> +	unsigned long touch_id;
> +	unsigned long stylus_id;

I wonder why do you track contacts yourself instead of telling input
core to do it for you and report BTN_TOUCH as needed? You just need to
call input_mt_sync_frame() when you are done processing input frame.

Does the device send all contacts state in one transmission or it can
transmit contacts one by one?

> +
> +	/* Boundary check - some devices report max value, adjust */
> +	if (x >= sdata->prop.max_x)
> +		x = sdata->prop.max_x - 1;
> +	if (y >= sdata->prop.max_y)
> +		y = sdata->prop.max_y - 1;

It is allowed to exceed declared min and max, so this clampin is not
needed.

>  
> +static int stmfts5_set_scan_mode(struct stmfts_data *sdata, const u8 val)
> +{
> +	int err;
> +
> +	u8 scan_mode_cmd[3] = { STMFTS5_SET_SCAN_MODE, 0x00, val };
> +	struct i2c_msg msg = {
> +		.addr = sdata->client->addr,
> +		.len = sizeof(scan_mode_cmd),
> +		.buf = scan_mode_cmd,
> +	};
> +
> +	err = i2c_transfer(sdata->client->adapter, &msg, 1);

Is this i2c_master_send()?

> +	if (err != 1)
> +		return err < 0 ? err : -EIO;
> +
> +	return 0;
> +
> +}
> +
>  static int stmfts_input_open(struct input_dev *dev)
>  {
>  	struct stmfts_data *sdata = input_get_drvdata(dev);
> @@ -371,6 +622,28 @@ static int stmfts_input_open(struct input_dev *dev)
>  	return 0;
>  }
>  
> +static int stmfts5_input_open(struct input_dev *dev)
> +{
> +	struct stmfts_data *sdata = input_get_drvdata(dev);
> +	int err;
> +
> +	err = pm_runtime_resume_and_get(&sdata->client->dev);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&sdata->mutex);
> +	sdata->running = true;
> +	mutex_unlock(&sdata->mutex);

	scoped_guard(mutex, &sdata->mutex)
		sdata->running;

> +
> +	err = stmfts5_set_scan_mode(sdata, 0xff);
> +	if (err) {
> +		pm_runtime_put_sync(&sdata->client->dev);

Reset "running"?

> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static void stmfts_input_close(struct input_dev *dev)
>  {
>  	struct stmfts_data *sdata = input_get_drvdata(dev);
> @@ -404,6 +677,23 @@ static void stmfts_input_close(struct input_dev *dev)
>  	pm_runtime_put_sync(&sdata->client->dev);
>  }
>  
> +static void stmfts5_input_close(struct input_dev *dev)
> +{
> +	struct stmfts_data *sdata = input_get_drvdata(dev);
> +	int err;
> +
> +	err = stmfts5_set_scan_mode(sdata, 0x00);
> +	if (err)
> +		dev_warn(&sdata->client->dev,
> +			 "failed to disable touchscreen: %d\n", err);
> +
> +	mutex_lock(&sdata->mutex);
> +	sdata->running = false;
> +	mutex_unlock(&sdata->mutex);

scoped_guard()

> +
> +	pm_runtime_put_sync(&sdata->client->dev);
> +}
> +
>  static ssize_t stmfts_sysfs_chip_id(struct device *dev,
>  				struct device_attribute *attr, char *buf)
>  {
> @@ -484,10 +774,8 @@ static ssize_t stmfts_sysfs_hover_enable_write(struct device *dev,
>  	guard(mutex)(&sdata->mutex);
>  
>  	if (hover != sdata->hover_enabled) {
> -		if (sdata->running) {
> -			err = i2c_smbus_write_byte(sdata->client,
> -					   value ? STMFTS_SS_HOVER_SENSE_ON :
> -						   STMFTS_SS_HOVER_SENSE_OFF);
> +		if (sdata->running && sdata->ops->set_hover) {
> +			err = sdata->ops->set_hover(sdata, hover);
>  			if (err)
>  				return err;
>  		}
> @@ -612,7 +900,7 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  	if (sdata->reset_gpio)
>  		stmfts_reset(sdata);
>  
> -	err = stmfts_configure(sdata);
> +	err = sdata->ops->configure(sdata);
>  	if (err)
>  		regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
>  				       sdata->supplies);
> @@ -620,6 +908,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  	return err;
>  }
>  
> +static int stmfts5_configure(struct stmfts_data *sdata)
> +{
> +	u8 event[STMFTS_EVENT_SIZE];
> +	int ret;
> +
> +	/* Verify I2C communication */
> +	ret = i2c_smbus_read_i2c_block_data(sdata->client,
> +					    STMFTS_READ_ALL_EVENT,
> +					    sizeof(event), event);
> +	if (ret < 0)
> +		return ret;
> +
> +	enable_irq(sdata->client->irq);
> +
> +	return 0;
> +}
> +
> +static void stmfts5_chip_power_off(struct stmfts_data *sdata)
> +{
> +	i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);
> +	msleep(20);
> +}
> +
>  static void stmfts_power_off(void *data)
>  {
>  	struct stmfts_data *sdata = data;
> @@ -629,10 +940,73 @@ static void stmfts_power_off(void *data)
>  	if (sdata->reset_gpio)
>  		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
>  
> +	if (sdata->ops->power_off)
> +		sdata->ops->power_off(sdata);
> +
>  	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
>  			       sdata->supplies);
>  }
>  
> +static int stmfts_setup_input(struct stmfts_data *sdata)
> +{
> +	struct device *dev = &sdata->client->dev;
> +
> +	input_set_abs_params(sdata->input, ABS_MT_ORIENTATION, 0, 255, 0, 0);
> +	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
> +
> +	sdata->use_key = device_property_read_bool(dev, "touch-key-connected");
> +	if (sdata->use_key) {
> +		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
> +		input_set_capability(sdata->input, EV_KEY, KEY_BACK);
> +	}
> +
> +	return input_mt_init_slots(sdata->input, STMFTS_MAX_FINGERS,
> +				   INPUT_MT_DIRECT);
> +}
> +
> +static int stmfts5_setup_input(struct stmfts_data *sdata)
> +{
> +	struct device *dev = &sdata->client->dev;
> +
> +	sdata->mode_switch_gpio = devm_gpiod_get_optional(dev, "mode-switch",
> +							  GPIOD_OUT_HIGH);
> +	if (IS_ERR(sdata->mode_switch_gpio))
> +		return dev_err_probe(dev, PTR_ERR(sdata->mode_switch_gpio),
> +				     "Failed to get GPIO 'switch'\n");
> +
> +	/* Mark as direct input device for calibration support */
> +	__set_bit(INPUT_PROP_DIRECT, sdata->input->propbit);
> +
> +	/* Set up basic touch capabilities */
> +	input_set_capability(sdata->input, EV_KEY, BTN_TOUCH);

This will be done by input_mt_init_slots(..., INPUT_MT_DIRECT). 

> +
> +	/* Set resolution for accurate calibration */
> +	if (!input_abs_get_res(sdata->input, ABS_MT_POSITION_X)) {
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_X, 10);
> +		input_abs_set_res(sdata->input, ABS_MT_POSITION_Y, 10);
> +	}
> +
> +	input_set_abs_params(sdata->input, ABS_MT_DISTANCE, 0, 255, 0, 0);
> +
> +	/* Enable stylus support if requested */
> +	sdata->stylus_enabled = device_property_read_bool(dev, "stylus-enabled");
> +
> +	/* Initialize touch tracking bitmaps */
> +	sdata->touch_id = 0;
> +	sdata->stylus_id = 0;
> +
> +	/* Initialize MT slots with support for pen tool type */
> +	return input_mt_init_slots(sdata->input, STMFTS_MAX_FINGERS,
> +				   INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);

Why INPUT_MT_DROP_UNUSED?

> +}
> +
> +static int stmfts_set_hover(struct stmfts_data *sdata, bool enable)
> +{
> +	return i2c_smbus_write_byte(sdata->client,
> +				    enable ? STMFTS_SS_HOVER_SENSE_ON :
> +					     STMFTS_SS_HOVER_SENSE_OFF);
> +}
> +
>  static int stmfts_enable_led(struct stmfts_data *sdata)
>  {
>  	int err;
> @@ -678,6 +1052,8 @@ static int stmfts_probe(struct i2c_client *client)
>  	mutex_init(&sdata->mutex);
>  	init_completion(&sdata->cmd_done);
>  
> +	sdata->ops = of_device_get_match_data(dev);
> +
>  	err = devm_regulator_bulk_get_const(dev,
>  					    ARRAY_SIZE(stmfts_supplies),
>  					    stmfts_supplies,
> @@ -697,8 +1073,8 @@ static int stmfts_probe(struct i2c_client *client)
>  
>  	sdata->input->name = STMFTS_DEV_NAME;
>  	sdata->input->id.bustype = BUS_I2C;
> -	sdata->input->open = stmfts_input_open;
> -	sdata->input->close = stmfts_input_close;
> +	sdata->input->open = sdata->ops->input_open;
> +	sdata->input->close = sdata->ops->input_close;
>  
>  	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_X);
>  	input_set_capability(sdata->input, EV_ABS, ABS_MT_POSITION_Y);
> @@ -706,19 +1082,9 @@ static int stmfts_probe(struct i2c_client *client)
>  
>  	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>  	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
> -	input_set_abs_params(sdata->input, ABS_MT_ORIENTATION, 0, 255, 0, 0);
>  	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> -	input_set_abs_params(sdata->input, ABS_DISTANCE, 0, 255, 0, 0);
> -
> -	sdata->use_key = device_property_read_bool(dev,
> -						   "touch-key-connected");
> -	if (sdata->use_key) {
> -		input_set_capability(sdata->input, EV_KEY, KEY_MENU);
> -		input_set_capability(sdata->input, EV_KEY, KEY_BACK);
> -	}
>  
> -	err = input_mt_init_slots(sdata->input,
> -				  STMFTS_MAX_FINGERS, INPUT_MT_DIRECT);
> +	err = sdata->ops->setup_input(sdata);
>  	if (err)
>  		return err;
>  
> @@ -789,13 +1155,62 @@ static int stmfts_runtime_suspend(struct device *dev)
>  	return ret;
>  }
>  
> -static int stmfts_runtime_resume(struct device *dev)
> +static int stmfts_chip_runtime_resume(struct stmfts_data *sdata)
> +{
> +	return i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
> +}
> +
> +static int stmfts5_chip_runtime_resume(struct stmfts_data *sdata)
>  {
> -	struct stmfts_data *sdata = dev_get_drvdata(dev);
>  	struct i2c_client *client = sdata->client;
> +	struct device *dev = &client->dev;
> +	u8 int_enable_cmd[4] = {0xB6, 0x00, 0x2C, 0x01};
> +	struct i2c_msg msg = {
> +		.addr = client->addr,
> +		.len = sizeof(int_enable_cmd),
> +		.buf = int_enable_cmd,
> +	};
>  	int ret;

"int err" everywhere where the variable carries error code or 0.


Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

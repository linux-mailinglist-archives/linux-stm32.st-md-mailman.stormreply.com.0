Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0649D001A
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Nov 2024 18:41:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D1F8C78036;
	Sat, 16 Nov 2024 17:41:24 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADE3EC7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Nov 2024 17:41:16 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5cfabc686c8so637430a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Nov 2024 09:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731778876; x=1732383676;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ugg/iLQbVd1pD0SvcWGfHZ1QyN8v0iCQir2+yUEZXS4=;
 b=ld3IptLURIQAzMeIuD+A6yl6Qe+pzNuycIEh2QNbrqaXXBih893l/7XrddZcIxajUO
 Gnsdq2SiaiIFcqHHL5OGeREEMHoKxAxVUOqPN1RZQF+AfwKBBmPrBPD/T9oJUq5Hb7l6
 wWyoF9lLxbsD3PwtFCL0HmGGsmjNwdUXeKKpBvqR1YpP12AIC+2IvcgEM3O0jOxCeQxO
 OvEik1ZE5NFQtQYnvq75TLY31/ScnWBjxO3W5OpUTYYDpVmx4/HzjcKrXZEEQBJa+5D6
 mSAJA9JBrE3bCzz37dkrOowb7K7NqYuevxL8JQuQVFV4DHOaxa5MmF0QJszeTB0eF9bP
 X18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731778876; x=1732383676;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ugg/iLQbVd1pD0SvcWGfHZ1QyN8v0iCQir2+yUEZXS4=;
 b=sL/R53CqI9janAIMNYiD4PU3HZ47Fvf1XWr75chkPcA1dU4b9SpHgEf/yx/zHV/yZ/
 hJoO2Yo2Kw/7DsS3vEwoH6H6jt/MLGqtRoGrFpAZBZfZwOdfI1f4X1Q4ZjGG0NJBDQI6
 IDlO4W5gHgNZJ86U45458mFV2tsKE3jJ6AopqfutlnOPO3KWfxNhfaYTZCtJu+/zEWzZ
 OMQ5yA7GGgGz9ZOeqcKAaoKh5ppubHdS92xCOKrtR5f8yLjz5Q9GonMuFMYKG9G02wMH
 mz6Zuq95JljYHhuMsfHM6E/RRpo0XCb6R5mcVCIImAiNiC6m9Zsp3mC60gdCoXa6D/1C
 tB4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFYzY2zxI3XNcsJzADLa0Et07BpyYuTOwJB9jkK0Uge690aURI78yS8aD0rYDRhwYqBRmCWp69YCRS4A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxezkFecj6WaCH3LDyrAUmyeAvyniKFrvr3XCt8ybkOsLrOz1dq
 hh4v9pq+F2ALtgD2xsErhp6or/pH9s9RJv7JF7ilFz9nQCeDp9db
X-Google-Smtp-Source: AGHT+IHpZmT4T8lybeJN/U2hl5jwfmp7spe4revMmxTiFh48M0jSiffKNt+oHZApVYuhlA+WSRjpUw==
X-Received: by 2002:a05:6402:440b:b0:5cf:3d11:c798 with SMTP id
 4fb4d7f45d1cf-5cf8fd10554mr5278428a12.28.1731778875892; 
 Sat, 16 Nov 2024 09:41:15 -0800 (PST)
Received: from ?IPV6:2a02:3100:a557:e100:45f4:697f:1405:21be?
 (dynamic-2a02-3100-a557-e100-45f4-697f-1405-21be.310.pool.telefonica.de.
 [2a02:3100:a557:e100:45f4:697f:1405:21be])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf79b9e761sm2895554a12.22.2024.11.16.09.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Nov 2024 09:41:14 -0800 (PST)
Message-ID: <3915908d-d70b-4fbe-b80b-990d02211965@gmail.com>
Date: Sat, 16 Nov 2024 18:41:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20241115111151.183108-1-yong.liang.choong@linux.intel.com>
 <403be2f6-bab1-4a63-bad4-c7eac1e572ee@gmail.com>
 <ZzdW2iB2OkbZxTgS@shell.armlinux.org.uk>
 <170a8d59-e954-4316-9b83-9b799cb60481@gmail.com>
 <Zzi7dqqZLCCVvlHq@shell.armlinux.org.uk>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Zzi7dqqZLCCVvlHq@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 0/2] Fix 'ethtool --show-eee'
	during initial stage
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

On 16.11.2024 16:34, Russell King (Oracle) wrote:
> On Fri, Nov 15, 2024 at 09:35:25PM +0100, Heiner Kallweit wrote:
>> On 15.11.2024 15:12, Russell King (Oracle) wrote:
>>> On Fri, Nov 15, 2024 at 02:41:54PM +0100, Heiner Kallweit wrote:
>>>> On 15.11.2024 12:11, Choong Yong Liang wrote:
>>>>> From: Choong Yong Liang <yong.liang.choong@intel.com>
>>>>>
>>>>> When the MAC boots up with a Marvell PHY and phy_support_eee() is implemented,
>>>>> the 'ethtool --show-eee' command shows that EEE is enabled, but in actuality,
>>>>> the driver side is disabled. If we try to enable EEE through
>>>>> 'ethtool --set-eee' for a Marvell PHY, nothing happens because the eee_cfg
>>>>> matches the setting required to enable EEE in ethnl_set_eee().
>>>>>
>>>>> This patch series will remove phydev->eee_enabled and replace it with
>>>>> eee_cfg.eee_enabled. When performing genphy_c45_an_config_eee_aneg(), it
>>>>> will follow the master configuration to have software and hardware in sync,
>>>>> allowing 'ethtool --show-eee' to display the correct value during the
>>>>> initial stage.
>>>>>
>>>>> v2 changes:
>>>>>  - Implement the prototype suggested by Russell
>>>>>  - Check EEE before calling phy_support_eee()
>>>>>
>>>>> Thanks to Russell for the proposed prototype in [1].
>>>>>
>>>>> Reference:
>>>>> [1] https://patchwork.kernel.org/comment/26121323/
>>>>>
>>>>> Choong Yong Liang (2):
>>>>>   net: phy: replace phydev->eee_enabled with eee_cfg.eee_enabled
>>>>>   net: stmmac: set initial EEE policy configuration
>>>>>
>>>>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  3 +++
>>>>>  drivers/net/phy/phy-c45.c                         | 11 +++++------
>>>>>  drivers/net/phy/phy_device.c                      |  6 +++---
>>>>>  include/linux/phy.h                               |  5 ++---
>>>>>  4 files changed, 13 insertions(+), 12 deletions(-)
>>>>>
>>>>
>>>> Russell submitted the proposed patch already:
>>>> https://patchwork.kernel.org/project/netdevbpf/patch/E1tBXAF-00341F-EQ@rmk-PC.armlinux.org.uk/
>>>> So there's no need for your patch 1.
>>>
>>> Patch 1 is an updated version of that patch, minus my authorship and of
>>> course no sign-off. I've already marked this series as requiring changes
>>> in patchwork (hopefully, if I did it correctly.)
>>>
>>
>> The updated version adds an argument to genphy_c45_an_config_eee_aneg(),
>> and I wonder whether we can do better, as this results in several calls
>> with the same argument. The following is an alternative, to be applied
>> on top of your original patch. I don't have a clear preference, though.
>>
>> ---
>>  drivers/net/phy/phy.c | 25 +++++++++++++++----------
>>  1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
>> index 8876f3673..22c9bbebb 100644
>> --- a/drivers/net/phy/phy.c
>> +++ b/drivers/net/phy/phy.c
>> @@ -1682,11 +1682,10 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
>>   * configuration.
>>   */
>>  static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
>> -				      struct ethtool_keee *data)
>> +				      struct ethtool_keee *old_cfg)
>>  {
>> -	if (phydev->eee_cfg.tx_lpi_enabled != data->tx_lpi_enabled ||
>> -	    phydev->eee_cfg.tx_lpi_timer != data->tx_lpi_timer) {
>> -		eee_to_eeecfg(&phydev->eee_cfg, data);
>> +	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
>> +	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {
>>  		phydev->enable_tx_lpi = eeecfg_mac_can_tx_lpi(&phydev->eee_cfg);
>>  		if (phydev->link) {
>>  			phydev->link = false;
>> @@ -1706,21 +1705,27 @@ static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
>>   */
>>  int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
>>  {
>> +	struct eee_config old_cfg;
>>  	int ret;
>>  
>>  	if (!phydev->drv)
>>  		return -EIO;
>>  
>> +	old_cfg = phydev->eee_cfg;
>> +	eee_to_eeecfg(&phydev->eee_cfg, data);
>> +
> 
> Hmm, don't we want to do this under phydev->lock, because network
> drivers and phylib may be reading from phydev->eee_cfg? If we
> update it outside the lock, and then revert, there's a chance that
> the phylib state machine / network driver may see the changes
> which then get reverted on failure, potentially leading to
> inconsistent state.
> 

Good point, then the patch would look like this.
BTW: Saw that Jakub applied your patch already.

---
 drivers/net/phy/phy.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 8876f3673..7f6594a66 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1682,11 +1682,10 @@ EXPORT_SYMBOL(phy_ethtool_get_eee);
  * configuration.
  */
 static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
-				      struct ethtool_keee *data)
+				      struct ethtool_keee *old_cfg)
 {
-	if (phydev->eee_cfg.tx_lpi_enabled != data->tx_lpi_enabled ||
-	    phydev->eee_cfg.tx_lpi_timer != data->tx_lpi_timer) {
-		eee_to_eeecfg(&phydev->eee_cfg, data);
+	if (phydev->eee_cfg.tx_lpi_enabled != old_cfg->tx_lpi_enabled ||
+	    phydev->eee_cfg.tx_lpi_timer != old_cfg->tx_lpi_timer) {
 		phydev->enable_tx_lpi = eeecfg_mac_can_tx_lpi(&phydev->eee_cfg);
 		if (phydev->link) {
 			phydev->link = false;
@@ -1706,18 +1705,23 @@ static void phy_ethtool_set_eee_noneg(struct phy_device *phydev,
  */
 int phy_ethtool_set_eee(struct phy_device *phydev, struct ethtool_keee *data)
 {
+	struct eee_config old_cfg;
 	int ret;
 
 	if (!phydev->drv)
 		return -EIO;
 
 	mutex_lock(&phydev->lock);
+
+	old_cfg = phydev->eee_cfg;
+	eee_to_eeecfg(&phydev->eee_cfg, data);
+
 	ret = genphy_c45_ethtool_set_eee(phydev, data);
-	if (ret >= 0) {
-		if (ret == 0)
-			phy_ethtool_set_eee_noneg(phydev, data);
-		eee_to_eeecfg(&phydev->eee_cfg, data);
-	}
+	if (ret == 0)
+		phy_ethtool_set_eee_noneg(phydev, data);
+	else if (ret < 0)
+		phydev->eee_cfg = old_cfg;
+
 	mutex_unlock(&phydev->lock);
 
 	return ret < 0 ? ret : 0;
-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

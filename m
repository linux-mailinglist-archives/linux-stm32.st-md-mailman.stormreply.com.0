Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC1KFhTVt2kYWAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 11:01:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AA7297973
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 11:01:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A848C87ED8;
	Mon, 16 Mar 2026 10:01:44 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013006.outbound.protection.outlook.com [40.107.159.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F994C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 10:01:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjkKPpMdAPIytxsWTBI2PIoloUBuFgEH29MsIprAX2l9qQ8U+tZy9l273x/gVRpNWbPG+XET+SQEBwOQ7JnRVPKs6ynMVk8ijYT4Rk0xcvfsJWUScPphBml1PC3bdv+Mu/hD45fy2yYnS4WnmJ7OEg8qL7xJ7rreGZradOVzLqeH4KaIuAjGd+mLR5z2Z8Vq3DsO6BrcS0Kfi4CwEcLsNaRLMA6krC5J5XyaysTCq0M8PNq/VL8SNex6tbdb/HEJo6gLyCpCcrD0sCSx+YIMVIQ3uwLz6L0LWClxTu6+ZUSNKgNx+gT6TvldMfkiSmo9BK3rjs5TdlnluSpLbq6YYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1dPuQPkXIrTFHptFtqg/EKxOBzhVDlSUppZpQXYWYw=;
 b=RM9OzfHKKgiiDW0tHSyHFFxmNStxqHepKNvtRBFuNrCYnCS52IWBLkfYG2O5CTmdk0ivo02mbPphzoY6ex0k4etEivsthGwR6kb2vN+75Az464vEA7eFApYTWOajwCE9KutSG1AsPNRUnGdSO1helss2rX5T06A4M6hHiUnmoBkrQVbm7o23BTlfTVLtDnkgKp78GjtHgCKqdZYGxZa4l4LS5Lq2bOVn0FJni8nOpElpW0T3XXOpdraLxCHnrNnnHXCHf09zU9qN9zcVBL2eXcDUvFbwxJW4pgFAS6RheaXrPLkNldjLyFfyJJ1kj6E4gAD0wX8Tfhtoe9iGR5e9+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1dPuQPkXIrTFHptFtqg/EKxOBzhVDlSUppZpQXYWYw=;
 b=DrzV+BXcd8VUogcaqiv/nwtuvWturMji2BP7eT3YAA9Ogou71DsdL23D1EChd/S+gqrcqZrGJkK3zRYxoUVLRICqjmfEX04R3BNphIeOUZqqRo7fZpWOdaeurH0Fv2aQ+Cciixjy22utms7wOSp3zW7p4RrJt/7PI9AOKj+xDLaGM943rim9SUHKwkJM3EHRtxl8s9yfWV+uNe2k9wa7A5g5RUuj6Bw3eLfob4rMgS7lbRaAemfDfpILxt0XAzqKFhDetYFjEFLChcwrih11Okw6tmzx0NJQfN7SkbYlntyqGudvJbo5USACbYZPFUJ6FqIUW8j6Fv+Xy3FY5x//hA==
Received: from DU7P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::8) by
 PAXPR10MB5688.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:247::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 10:01:28 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::23) by DU7P195CA0013.outlook.office365.com
 (2603:10a6:10:54d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 10:01:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 10:01:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 11:03:36 +0100
Received: from [10.48.87.194] (10.48.87.194) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 11:01:02 +0100
Message-ID: <4de50fb9-35e6-48e7-8111-c5a94099d4f7@foss.st.com>
Date: Mon, 16 Mar 2026 11:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Linus Walleij
 <linusw@kernel.org>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
 <abfHUrOpHnjv3GGW@shell.armlinux.org.uk>
Content-Language: fr
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <abfHUrOpHnjv3GGW@shell.armlinux.org.uk>
X-Originating-IP: [10.48.87.194]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|PAXPR10MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc3f63e-4c37-48fb-9a55-08de8342fd3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003|7053199007|8096899003;
X-Microsoft-Antispam-Message-Info: pC4P58IL/6NgjTXvQ9UlegYoDMP22vjK1NI3t0x+sVgmaXCiRaS2TS1x0eCzJvHNvq1SZud3ltVXKGJ35dqQL0HbbYlkukhTAP3JNtFhwIeQmgqnJ6R5Ib5n6NNFy+NvJBJ+v2OOj/VEZkRChJUqJV1KrWpslnQptB16rlPVWB+Pk+gseoX3YYf1RHOEEpuIdYCmlVxrDDmgFoMku+2YZF+5U8pTIlkAX11Jw4H3Z5wVHN2MZ8Kn0cJ8YIg0Zgn/fgOCUihEd42rAI0qipqioE5FoOQ24u2kam7CaAkz7EVl2V26TJGyK327Ec3scOMhDre9BRbZk9Hhb3OtHCcA8hMCx/Hl1oN1pi+58/JcC6XBJEu873XA5iBRCzgPiN2kHaqWpp4dt9cpMMQsMCv8PzUn+vjeVZpl7htZeEVZ6GKFD+tIZS5Y9koyd4V3Y9AHdY8Y4myzTk3DIjWtstRGYoFgdMyvf67wJiS1xzYhFisl2UFYYKqKIXJmeWyml0R5XfHHUkerESHQe4NS4wuguIZqjmEZmu2G/7Dtx+D2SIc4zDjHpUOxjwakf2VgO4PzUOgi5+7TZ0GAm2k/I8S+5xtNFziKaPsVvy89tNK+imjCsIMscRBakhvvYgdL1ilBTKAKnDnwgwLZzFdkqsKSVHSHuDrMTyqL5Q4V3xxI/vnVJ0y4YActy8q9RaCNRC77Zvj/yzHm57rgWCIBFSLts7f791DTK2Qgcze/RR60aROoT9gHhHzy2bRcpoWIGNXJd66vbjSLLCvNV9QBs6SHKA==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: udPhoPJq1fWxYu4bVVxysLs7hPSE6cnnd5GCFAlJDgVB1gq04JnnrKqQViQyWaKSYgxqjgUT6cWm57H1rTEd3FbN71/iPDatp0k1jJvZ9IZQHgaOKGlDZMSB1b3uf690XV0Suhqkcp+7G0mVMcGefA41IjzDqt6vZj1FxPaqH/lk40DlBySjkQ0KK3ioFcxlTaO9M5J/a81y0foJrm9Mgbx2gboCN5OO47YQUHz/ECB6R+Kz2eSnW5jK9YDh/KPasrJehLXy/9EpjYLzUvDIPu+Slcmc5EmxQ0DmkZIz22QUoDeXApLXTyhWLzhF4FsN6T7V5O+D3aVAoY7hF2ef1hvUVpRc3Yxh1rAon11L1Zx6prvkbdrxF2Eb0+Fy/25PXwLuZG8Cmt4IpGO0LZIflEQgq1UD84OTIiH6lvDyGFCGfPfZcIlQezb2rnbc171f
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 10:01:27.1816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc3f63e-4c37-48fb-9a55-08de8342fd3d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5688
Cc: linux-kernel@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] net: stmmac: fix pinctrl
 management during suspend/resume
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
Content-Type: multipart/mixed; boundary="===============2142216072373694120=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[multipart/mixed,multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[13];
	RSPAMD_URIBL_FAIL(0.00)[armlinux.org.uk:query timed out,stormreply.com:query timed out];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~,4:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_SEVEN(0.00)[7];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_SPAM(0.00)[0.446];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stormreply.com:email,stormreply.com:url,armlinux.org.uk:email]
X-Rspamd-Queue-Id: D7AA7297973
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============2142216072373694120==
Content-Type: multipart/alternative;
	boundary="------------w0XdXRSgq7Qw02VZXp1ZMSvj"
Content-Language: fr

--------------w0XdXRSgq7Qw02VZXp1ZMSvj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Russell, Linus, All,

Le 16/03/2026 à 10:03, Russell King (Oracle) a écrit :
> On Sat, Mar 14, 2026 at 12:37:19AM +0000, Russell King (Oracle) wrote:
>> On Sat, Mar 14, 2026 at 12:44:56AM +0100, Linus Walleij wrote:
>>> On Fri, Mar 13, 2026 at 12:08 PM Russell King (Oracle)
>>> <linux@armlinux.org.uk> wrote:
>>>> On Fri, Mar 13, 2026 at 11:57:16AM +0100, Christophe Roullier wrote:
>>>>> In the deepest low-power modes, the pinctrl configuration is lost
>>>>> and is never restored if the interface is down.
>>>>> This commit ensures that the pinctrl state is set in all cases.
>>>> Shouldn't the pin state be restored by the pinctrl layer?
>>> What we have in the device core only applies "init" and "default"
>>> states, and provides these handles for transitioning to "sleep"
>>> and "default" again (like a state machine).
>> What I was meaning is that - for a driver using the "default" state,
>> if the hardware loses the pinctrl state during sleep, isn't it the
>> responsibility of the pinctrl driver to restore the state rather
>> than leaving it in whatever states it happens to be when the SoC
>> comes back from suspend?
>>
>> If that is not the case, then don't we have a major issue where
>> drivers using pinctrl but do not issue any pinctrl calls in the
>> resume function are buggy?
> I would like an answer on this before this patch is merged, because
> even with your reviewed-by, I don't think this patch is correct.
>
> For example, if pinctrl loses the pinmux state across suspend/resume,
> then this patch only solves the case where the NIC is down when
> suspending.
>
> It does not address the case where the NIC is up but WoL is disabled.
> Also, what happens when WoL is enabled at the MAC, when we expect the
> NIC to still be functional - which means that the pinmux state must
> remain active over suspend.

For me this case (when NIC is up) is already managed by the driver and 
function suspend/resume:

On stmmac_suspend :

==>      /* Enable Power down mode by programming the PMT regs */
      if (priv->wolopts) {
          stmmac_pmt(priv, priv->hw, priv->wolopts);
          priv->irq_wake = 1;
      } else {
          stmmac_mac_set(priv, priv->ioaddr, false);
*         pinctrl_pm_select_sleep_state(priv->device);*
      }

On stmmac_resume :

==>     if (priv->wolopts) {
          mutex_lock(&priv->lock);
          stmmac_pmt(priv, priv->hw, 0);
          mutex_unlock(&priv->lock);
          priv->irq_wake = 0;
      } else {
*         pinctrl_pm_select_default_state(priv->device);*
          /* reset the phy so that it's ready */
          if (priv->mii)
              stmmac_mdio_reset(priv->mii);
      }

BR

Christophe.

>
> This is in addition to a more general concern that almost every driver
> in the kernel is likely broken if we need to switch pinmux modes on
> resume to ensure that the "default" pinmux state is restored upon
> resume, which seems to be what you're saying by giving a r-b for this
> patch.
>
--------------w0XdXRSgq7Qw02VZXp1ZMSvj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Russell, Linus, All,</p>
    <div class="moz-cite-prefix">Le 16/03/2026 à 10:03, Russell King
      (Oracle) a écrit :<br>
    </div>
    <blockquote type="cite"
      cite="mid:abfHUrOpHnjv3GGW@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">On Sat, Mar 14, 2026 at 12:37:19AM +0000, Russell King (Oracle) wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On Sat, Mar 14, 2026 at 12:44:56AM +0100, Linus Walleij wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On Fri, Mar 13, 2026 at 12:08 PM Russell King (Oracle)
<a class="moz-txt-link-rfc2396E" href="mailto:linux@armlinux.org.uk">&lt;linux@armlinux.org.uk&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Fri, Mar 13, 2026 at 11:57:16AM +0100, Christophe Roullier wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">In the deepest low-power modes, the pinctrl configuration is lost
and is never restored if the interface is down.
This commit ensures that the pinctrl state is set in all cases.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
Shouldn't the pin state be restored by the pinctrl layer?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
What we have in the device core only applies "init" and "default"
states, and provides these handles for transitioning to "sleep"
and "default" again (like a state machine).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
What I was meaning is that - for a driver using the "default" state,
if the hardware loses the pinctrl state during sleep, isn't it the
responsibility of the pinctrl driver to restore the state rather
than leaving it in whatever states it happens to be when the SoC
comes back from suspend?

If that is not the case, then don't we have a major issue where
drivers using pinctrl but do not issue any pinctrl calls in the
resume function are buggy?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I would like an answer on this before this patch is merged, because
even with your reviewed-by, I don't think this patch is correct.

For example, if pinctrl loses the pinmux state across suspend/resume,
then this patch only solves the case where the NIC is down when
suspending.

It does not address the case where the NIC is up but WoL is disabled.
Also, what happens when WoL is enabled at the MAC, when we expect the
NIC to still be functional - which means that the pinmux state must
remain active over suspend.</pre>
    </blockquote>
    <p>For me this case (when NIC is up) is already managed by the
      driver and function suspend/resume:</p>
    <p>On stmmac_suspend :</p>
    <p>==&gt;      /* Enable Power down mode by programming the PMT regs
      */<br>
           if (priv-&gt;wolopts) {<br>
               stmmac_pmt(priv, priv-&gt;hw, priv-&gt;wolopts);<br>
               priv-&gt;irq_wake = 1;<br>
           } else {<br>
               stmmac_mac_set(priv, priv-&gt;ioaddr, false);<br>
      <b>         pinctrl_pm_select_sleep_state(priv-&gt;device);</b><br>
           }</p>
    <p>On stmmac_resume :</p>
    <p>==&gt;     if (priv-&gt;wolopts) {<br>
               mutex_lock(&amp;priv-&gt;lock);<br>
               stmmac_pmt(priv, priv-&gt;hw, 0);<br>
               mutex_unlock(&amp;priv-&gt;lock);<br>
               priv-&gt;irq_wake = 0;<br>
           } else {<br>
      <b>         pinctrl_pm_select_default_state(priv-&gt;device);</b><br>
               /* reset the phy so that it's ready */<br>
               if (priv-&gt;mii)<br>
                   stmmac_mdio_reset(priv-&gt;mii);<br>
           }<br>
       </p>
    <p>BR</p>
    <p>Christophe.</p>
    <blockquote type="cite"
      cite="mid:abfHUrOpHnjv3GGW@shell.armlinux.org.uk">
      <pre wrap="" class="moz-quote-pre">

This is in addition to a more general concern that almost every driver
in the kernel is likely broken if we need to switch pinmux modes on
resume to ensure that the "default" pinmux state is restored upon
resume, which seems to be what you're saying by giving a r-b for this
patch.

</pre>
    </blockquote>
  </body>
</html>

--------------w0XdXRSgq7Qw02VZXp1ZMSvj--

--===============2142216072373694120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============2142216072373694120==--

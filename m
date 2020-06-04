Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C841EDB41
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jun 2020 04:36:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9635EC36B21;
	Thu,  4 Jun 2020 02:36:32 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68307C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2020 02:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D1DudB4SCL3zmp/xWIPaEkzrRVxU8QNLQCTqrbXNlUr3uZm8p+rWvXwl2Urpr58OCVIBVeSZ6fYRxr5GxcF1fmU+C20QIMKEhjZtUKycYW3K3qW5aM2mcBEkaylwWyb46NtaXyeL8qWpN3QR5ussamXG61ZX3/xlOteG633STyrXKmquvHH0Y6sYeSYkFv44B7AAmz5p4+5BJeOB40vhhhoWTz6DI93A2bBrUtRbUQtoms1SC3krBVPRMKEG6UFZrzw4TgCgGf59B3UDATeesjLtws9Sw1M6fxqnmgaFVHh49ynvtyeDvox24ikqptCEMZnN5r7IRFRPykxe2GA/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDQHXDsTaick5RedFb6PCmFYQJtR4hT2nG/MVl0FtVU=;
 b=EhmXd57WVGtjl7tJbcwQCaWikQwKwjXTKE2zpWHOYM30C0ySMkdS0Bei1+PT+ikLu+VbriNfJmBIxgUnUhN+xws62TkI5ZM1XxyUsB0GHPOjASPb8jzqC9atvMUYp0LUkeFqZ9faAhg1sJ6PpgfaO85zS5WIkZuWggk/3qJEjJta4YbU9Bis+aZQRuZpRW9If+xUaLZovIUNkEIsWpSwTX1fYNFQ36iWergIs7Sm3SDrmObvVT3/vS/AMnvg/ejnbKPsD6bDhmmIMldwguIWsI6bl0SLWnGaSriI2rbdqMRI7QRq02c6nOhcjd5tB5uh/sPEcRM9kvEQZmxKh7yqZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDQHXDsTaick5RedFb6PCmFYQJtR4hT2nG/MVl0FtVU=;
 b=ZMnMWrESqKNAtpr7jhmVOvXoL8FocX+0/ozfZPWcZP0w0FlqPPgPxCVXKd6TNB/E6lzw6T/yF/qE4lTPyCdLpp0jYznTaizKjJ5n8bqfk9otx/216fNxzcZRySyqWgfRqfwhK29ZFeUYW5HjXOr8urIg1gjvoxHejS1pTCrNq0U=
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 (2603:10a6:209:12::18) by AM6PR0402MB3527.eurprd04.prod.outlook.com
 (2603:10a6:209:6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 02:36:28 +0000
Received: from AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1]) by AM6PR0402MB3607.eurprd04.prod.outlook.com
 ([fe80::35f8:f020:9b47:9aa1%7]) with mapi id 15.20.3045.024; Thu, 4 Jun 2020
 02:36:28 +0000
From: Andy Duan <fugang.duan@nxp.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>
Thread-Topic: [EXT] [PATCH net-next] net: ethernet: dwmac: Fix an error code
 in imx_dwmac_probe()
Thread-Index: AQHWOc+DMpUVYvKlDkqH243mKsxfkajHvadQ
Date: Thu, 4 Jun 2020 02:36:28 +0000
Message-ID: <AM6PR0402MB360703C2D2EAC8A58D7BEF2DFF890@AM6PR0402MB3607.eurprd04.prod.outlook.com>
References: <20200603175025.GA19353@mwanda>
In-Reply-To: <20200603175025.GA19353@mwanda>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f5f4fb41-2853-45ca-5c84-08d8083015a2
x-ms-traffictypediagnostic: AM6PR0402MB3527:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB352784D14FA0CAE7DB218D6CFF890@AM6PR0402MB3527.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:785;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zxDnyBf+NUawQ0u8MzlYPZp6WLeaQUwu0x+BK7H4EncOtOdcdoV2KEb4eQasLs9Li6eOIwwUh8JEkqjnPPj5548No1N6JmvNuehcIT4+hRoWct5Q682JyAi2AmnHgJGoyxyPVJgxSgQ3iA2zm9Hd5YXipMxKSsBr0ImRaWy8GVXQtNp0PKdOYH2+tqSIPbWZbJLOCU0ehKd7IJXPkK2pPFadG3jCNSrTd2P70vvz8eZEeMrT+3bpYUfZbgp9ce4EEKxG9ougyJciZLOXHwkK+r5W+PYY1AK0zYauJXTwXSEz1qSRkAkGU3J6xSnn3/+F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3607.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(54906003)(76116006)(5660300002)(83380400001)(66476007)(64756008)(66446008)(66556008)(66946007)(8676002)(110136005)(8936002)(4326008)(52536014)(2906002)(316002)(33656002)(7696005)(6506007)(7416002)(478600001)(71200400001)(86362001)(9686003)(55016002)(26005)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: GWsgkfonioMnefdd5KJY2OFWrYYD4rGij2UmuvM1K/NzsmOYxxVN0W2piPlumTwXiiPDonAkfKu3AmZAm+AnPIRSCDSHRG7qzPOv5ks3eodIklvpnTBPDZAV/eRTA+/8ojZME1yRo2dEsvLWQlCeLtJma0y7kSqjeFTi2EOQEwIzznTpsBsxcW0rfMb9yPbFeor+dFfvlQG3/A5HRabmpynDYRHai2QyFfSDkeTnvwvTWxUJE60Y/VfbgxrvK4wF1DMOLAB4FTVhRzugkP9VMVp2arkGzlDWS/i/F1X6aMCY2xNlBUPrXmnRhwt2kiHwRQ7SYq/USClJ/IKVBwR6h1qFH9I1HXFMqK7MSUFyTpjx6qmG4Gowc4sAhg37+3f0d85YDs1fFadtSGgQgZLu/JaFJPXk/vG//CZfYQaoz3hNiwd4eUKPXmGokJPaQKzgsHJlGwSGDueHWhi4ephvfA338kdmAJL27rxSbK4g73k=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f4fb41-2853-45ca-5c84-08d8083015a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 02:36:28.6101 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YMBSPYuwXPA8Vy3GErwgJDqweN1TjuHxE35YIwmtDy9kNaHAoBMg59xB4SyCJ5DIU07YRv2aF2y53tzUiIPDnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3527
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 dl-linux-imx <linux-imx@nxp.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [EXT] [PATCH net-next] net: ethernet: dwmac: Fix
 an error code in imx_dwmac_probe()
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

From: Dan Carpenter <dan.carpenter@oracle.com> Sent: Thursday, June 4, 2020 1:50 AM
> The code is return PTR_ERR(NULL) which is zero or success.  We should
> return -ENOMEM instead.
> 
> Fixes: 94abdad6974a5 ("net: ethernet: dwmac: add ethernet glue logic for
> NXP imx8 chip")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks!

Acked-by: Fugang Duan <fugang.duan@nxp.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index 5010af7dab4af..3c5df5eeed6c8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -225,7 +225,7 @@ static int imx_dwmac_probe(struct platform_device
> *pdev)
> 
>         dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac),
> GFP_KERNEL);
>         if (!dwmac)
> -               return PTR_ERR(dwmac);
> +               return -ENOMEM;
> 
>         plat_dat = stmmac_probe_config_dt(pdev, &stmmac_res.mac);
>         if (IS_ERR(plat_dat))
> --
> 2.26.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

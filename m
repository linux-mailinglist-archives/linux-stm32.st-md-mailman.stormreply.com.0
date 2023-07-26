Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B659D76335C
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 12:22:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63FAAC6A61A;
	Wed, 26 Jul 2023 10:22:26 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8DFD2C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 10:22:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIFtW7p5NneMA7/nwVeSiqn3z+HdxwnXGuB0xHU4fC4d3Y1PKKee8mUSWdiUMEAFQoCjU73MRJXcGngs6lhB/WEKPGdV8y5zmymGOVvPGujkIMqIEhpnfMgn4lvU6koH8LZHnxluPOBa0wzcMQHiIV4zTeIYnMm5USaD/hi8DZv/9v3J9WlJQzO5L32DUbGOY8Kv6O8QNIR20KAwLwxwZ+PqbeJKfECjW+xLInwscvvTvv4xEHPbO7uKwczrv5i6BZAE8O7Ql/v9Q3GutkBx15MAho4Pj/8+W/HVOKsmQG+EBAyPrgAsgxsQfmUNcVcxm6wsHoSwQpnmHqopQb0KgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlKAvKBJ6Zu1DJbtGkdno2FuJG2yLtkD7FFG7VtyokA=;
 b=IBeT+UbM/sh0hMjpHFPtLuuX5aSYnFfDYLnAIb9i+AEUqMdPsUWs7oXrbocol77sXVoIhY249fG7X98yoCjv0vJ8LC0LLVABEOr5zFjIGwYKOsT0KwsAD9+yQWOdAE9yfprvasZqi44F8F4tZjbyP+ZtpysWQik3pTJwEPGJDi4T52n382j1tAmzbKxcU4rB0+dyIqUHCimhLAujMbdbbd/DuTYmCP8022As4r5qN7++i9oWzqidOqgxY1yfU3GkSRReHtyBgtLr4LkhBopKb1qxlUABv8NfT8GJNn2yZ5yEZw2jCC7x46v52YbdwBVdLXpl0/Euln5+BuiC6GmN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlKAvKBJ6Zu1DJbtGkdno2FuJG2yLtkD7FFG7VtyokA=;
 b=bZcAe3+gwR7qqLqHPot6JR5gfnk5IVmEoBNTsuUvBdRI5WOkDErIj7qh5NUHAzqeXdV7GzO0/wBPNpUg3/dAZlf2z2Ubag7PLrXBfHYGX3z8466AANOFy4bX3hMzWDV+RJSoQ6EmxeBg7iBGdLdIK4xx2z3+aPOMNip9f0Y1u8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CO1PR13MB4840.namprd13.prod.outlook.com (2603:10b6:303:f6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 10:22:23 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:22:23 +0000
Date: Wed, 26 Jul 2023 12:22:12 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <ZMDz1AhlEeZTM/vi@corigine.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-6-gatien.chevallier@foss.st.com>
Content-Disposition: inline
In-Reply-To: <20230725164104.273965-6-gatien.chevallier@foss.st.com>
X-ClientProxiedBy: AM0PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:208:1::17) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CO1PR13MB4840:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc01507-a6b8-42b4-4e80-08db8dc233c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pTSGKGSWD904YY11SLaR0Cg3LbsXcdHKOlWv40vhhIqen8/F06Y1B5SvhQZn8gcU0fqpqpsCSRWDFCvtPl9qp6TLRArlBuBk5NAft/MF+lfT30QmMPUWBwHmwVpghoWV9xqLYE1vN5j/TGVB5e24UUeKXgH59GIOuDfHf3fh6N7Wx1apmq4AM8EKgRW/ya02TuL7R/TKq0+TDkwuFuDgtlgNmPMQEDbyKQ6JdK6R0AWa9dfmz+Ura/9vb5lPT7JzKu5p8A9wEnHnDmsjNMRqY+IXo7HX/M9NLEfLTU/kju0zV7K55dKp5ok8msjKgmKc7YadJF+TtfO55hSxE8/YPoNZzFCs8IncVu9xRoEPlZPbSfHV6ODIzRuIZcHJ8U6l4lBJozl7KUtXNpsqUAVboBMCICrWrjzbrA0Z6XQ7RxlgfUIov2qe29OYC43+ZulEGxITh9F/uBNLw334giDPBGxhDnZIpVXAzJYv9T6mau7TXuSD4SZoIR1RDH17GtEoQXRXKM41dE/mqorzmUQVSFyHa7GAJLS3etvIQSMkhDFEXHh8SGiowO3pKO/bdcNzlVMP5Y1ZRK18L+wGkNk6zFJ8TdEMWRS/hEypyqtxSvo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(366004)(376002)(346002)(396003)(136003)(451199021)(6666004)(6486002)(478600001)(6506007)(6512007)(6916009)(66476007)(4326008)(66556008)(66946007)(186003)(2616005)(38100700002)(44832011)(5660300002)(7406005)(7416002)(8936002)(8676002)(2906002)(4744005)(316002)(41300700001)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p4dhcp7ceHRMf9PxLP7UKVmzkTGc43zOFzIfwC2eB0YKk2CBEclCXiiYx7wc?=
 =?us-ascii?Q?oSP6k0m3zGOuAfpBms/D7bcEuyKA8HdAAdHPXEnWG09oLmqpcal/93EA7edR?=
 =?us-ascii?Q?T4LjL70cjR83snnbD++RSu+fDwJMHQNdf38o+0ThFDILhjkq8wZeM7cBOZ0G?=
 =?us-ascii?Q?5SgHA1XLozcDgQhBFvSw7bE/v9HcoOp45xzXAcnaoxb4JHDvzrMHZD5jcz9Q?=
 =?us-ascii?Q?QrqKKKipPVI9gSzR9yjvFgWNpOSHcqbyA9KhwEACVA5u9Sm/3OK3hEY7tGY2?=
 =?us-ascii?Q?htWoOGeUxfeX5KXlR/FXI4+aaq6TEbvGu8FqVCvaLDdtRJNs3Udc8SVMgZZR?=
 =?us-ascii?Q?JCRwR+cCQxAiGE9Vd76YYHwZ8+zOW9P+9vRrB6fPPToVS8z+u+46puXgAoTk?=
 =?us-ascii?Q?cbuksAIqkZA0EbkTF7CClyIa7Bmikl8WfQ2vUe4EX3GI+ROGJNtrKEc3VEiT?=
 =?us-ascii?Q?TBz9IV/MJ0ULLYxuLwyDL9Qs4hyxMg93/NhYXwcmcuaUQVx/OHcC2cVt66dD?=
 =?us-ascii?Q?pJmKmUQj/pzpl3zVCI25zF6QCYHgIXgj38mq7PSJcq5UvNNPn/CHiYPacDQW?=
 =?us-ascii?Q?+SXWpMZIoRU9Wk2OtDg2IOnOOgDqglFBFnZRci9EF9IMprpHgZWu4EWPBb0N?=
 =?us-ascii?Q?YZidnovZcqO6SML+djrs+o/PxRMdNEa1WXvsq5CBg3DauBG34HlguJ+i4pNm?=
 =?us-ascii?Q?dYz/CPQrbkdlLfa/8KQHhu5lAb/WFVUSeQWfkhW3vvh8mH+Fwv9Pa4VYEalI?=
 =?us-ascii?Q?3ua2NmFD+umxSDu0z4ZgVGP0vrtQFdyyZNENaKQDRLRYv8BcDlPicaKgS/pR?=
 =?us-ascii?Q?xzJrxnGh48Al0UThh5zTSyjq4XAl36vXYlU/YfKZ69OXLBBf40BPhwRJ8oms?=
 =?us-ascii?Q?eL2UDbtN8a3Zv7KL+TCYiTLVDfJdv5WCb/bzSO7Tkf2wjmJP4Zh+w6nkHl2Z?=
 =?us-ascii?Q?aT15CjkowaP3CbfHAQRlKBGNcq7xg31x8os//IfSYZmlCSzduUmW9Z7mDRjm?=
 =?us-ascii?Q?z/mZ/3TYOprMDcSn1exqjYq5ggW50NrKAELXcafUAftxcujUvuAjSANNE9Lv?=
 =?us-ascii?Q?RxY2jm/ERQrct0iVFKPlLdT5xX/fvd2lyi9wbAq3t1fwIOHBduuEKy4rtKMn?=
 =?us-ascii?Q?GPYoNwyZ9G0j6oX9Uepg1aWPXn3OKg+J4CXZc3goFclbaN/+3S5NFtrq0PB4?=
 =?us-ascii?Q?1SWGnemlv14IxQgAs0W0mmhn5mtzTn6G51BFRXTD3fiWYI4iaqdZu2rNExBU?=
 =?us-ascii?Q?WAf8KdZoDiOS7lS1W4sfjgYtr5fixj/egOb8lnSsMr8ImRfq+sQrnYC6oXqv?=
 =?us-ascii?Q?oPV6+FtuVoRxqkcpCfOFDi+rdBmgatQvDU4PiwNLPBi1girWkmBMtLCAraO/?=
 =?us-ascii?Q?BSsm+q9ycQOKUNZaCfi6j7dqkrv0asixPmQ+4xm+9gX1cfEAIOq+ugNDR1UH?=
 =?us-ascii?Q?ScGObKZjHwZPHEVxqX3EnVpCKUjKH3ruoK8BdhxurUs3UQeAoyqBQe2iFQ7A?=
 =?us-ascii?Q?k21ifWfKlM+dnu15PIYUiyE3GdQqGtD7h25jidYDyY+7cRKfXz2gpuUecx49?=
 =?us-ascii?Q?fNAzaGQjuOOxQAEQvIDj7weMoX9aDQs+L2xBWZM12HRySHiTHRwRAyWZ6q2t?=
 =?us-ascii?Q?rz4kCfoP6FGCARnCXwcwTfnSx7GNO2zsU/xjQtIthyu1DednUOIIcBe+YRSa?=
 =?us-ascii?Q?dO9W7g=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc01507-a6b8-42b4-4e80-08db8dc233c9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:22:23.6707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85f4MKcsU35zyTU6yCfRjheQIZ5KfV20YFbpawl8e9rEALD1U4SpjwR/z8XrM4BTMc8GG68BHYFnVXxyjzuNNIrIsJxxDpfGfQmdRv4Qw0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR13MB4840
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 robh+dt@kernel.org, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 05/11] firewall: introduce
	stm32_firewall framework
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

On Tue, Jul 25, 2023 at 06:40:58PM +0200, Gatien Chevallier wrote:

...

> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c

...

> +int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
> +{
> +	struct stm32_firewall_controller *ctrl;
> +
> +	pr_info("Registering %s firewall controller\n", firewall_controller->name);
> +
> +	if (!firewall_controller)
> +		return -ENODEV;

HI Gatien,

Sorry, one more on this patch, that I missed before sending my previous
email.

firewall_controller is checked for NULL here.
But it is already dereferenced on the line above the check.

Flagged by Smatch.

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

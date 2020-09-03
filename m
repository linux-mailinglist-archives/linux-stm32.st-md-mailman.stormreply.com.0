Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFA325C0C2
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Sep 2020 14:08:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 341FDC3FAD8;
	Thu,  3 Sep 2020 12:08:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2052.outbound.protection.outlook.com [40.107.20.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A44E9C36B21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Sep 2020 12:08:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekkeQc+IcR6blKHVszStk7bHVgH0XFlIpkv0MX3TdcyCad65xVZmx+2M25XRa5bLdYImtr0IwaSomu9zUomp3VutlDTd7/12n+5izKNHc89Gm4hm9e51Ocpxxuoo0HrF59K0L5CBlueUcPLzmI8rCC9DEQ3cTZbkWiIAKhbqxEI7sCeXOcvimTfhACmoKISnYCC5rsP8WnhqZOWbUp+5G2BAc2CSGyUDmiXiXDICaLk8DrPDUwrQPG9TUIRmA5m9ogeiatoj8dYZ0/Oq5uErawKG5IrOrwskJWP1Gfeta0PjlJvUN/zJ/3l9tN/gZ38bO8kH/Wg+DPNuDiTCx48+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7wDynfUjSwaCwO8ODwF+RczjlJu+liDEdlOxyzs3Wo=;
 b=LGZV8IyURXrjEYq5ybTk8cxVDE/UdCAxqWYUR0ZTnxB7PoEzWotAXFC6JCzByJ6DfMAFmtqnOS1FBha3bKYxWflhN+Z/LMal2aR9XG40oPUnVLEtzoljAaWLUXT37OPeCmVOP7HrpqnCmO1ymRUfaoqFfma4sAyaJfmj5J5TOzIKRmbZ1idmbQo6xzctCkK7cWAgMJnE1bGW9LxjCh9X60RB0MN9bnqwu5jZnNvVed+ZqoN3hPTu/s07OwkwT/tRCekMlQfj+Bqfe6t0TlwLUECJDjpHDZGfGTnU6JfEHrnihcNmpRpD1qUWWkFYgO3jzgMKZcuHJ6AMUMXP7+Ghig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7wDynfUjSwaCwO8ODwF+RczjlJu+liDEdlOxyzs3Wo=;
 b=CSDDAxuyQVcybWHswsPYmXwtkDKRlrSsyCO1ZXXwO8HM8wWyTw46yWVzsgZ2YwraEVgNUqHGu/GAGTeSgUm6TtU6X7lHQVuGCImq4mt/5CYYw36NG7lKSjoj8izeaIUKCGkrs43QOenHWuV2bMrI5RJDVE73Ftx8P6EhIJ8byMM=
Authentication-Results: st-md-mailman.stormreply.com; dkim=none (message not
 signed) header.d=none;st-md-mailman.stormreply.com; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR0402MB3712.eurprd04.prod.outlook.com
 (2603:10a6:803:1c::25) by VI1PR04MB6944.eurprd04.prod.outlook.com
 (2603:10a6:803:133::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Thu, 3 Sep
 2020 12:08:52 +0000
Received: from VI1PR0402MB3712.eurprd04.prod.outlook.com
 ([fe80::2951:31f4:4e49:9895]) by VI1PR0402MB3712.eurprd04.prod.outlook.com
 ([fe80::2951:31f4:4e49:9895%5]) with mapi id 15.20.3326.025; Thu, 3 Sep 2020
 12:08:52 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, =?UTF-8?Q?Horia_Geant=c4=83?=
 <horia.geanta@nxp.com>, Aymen Sghaier <aymen.sghaier@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Chen Zhou
 <chenzhou10@huawei.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20200902150530.14640-1-krzk@kernel.org>
From: Iuliana Prodan <iuliana.prodan@nxp.com>
Message-ID: <a273f81f-cdf9-70ae-3691-816fa24be0a9@nxp.com>
Date: Thu, 3 Sep 2020 15:08:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200902150530.14640-1-krzk@kernel.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::38) To VI1PR0402MB3712.eurprd04.prod.outlook.com
 (2603:10a6:803:1c::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.13] (86.127.128.228) by
 AM0PR07CA0025.eurprd07.prod.outlook.com (2603:10a6:208:ac::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.9 via Frontend Transport; Thu, 3 Sep 2020 12:08:50 +0000
X-Originating-IP: [86.127.128.228]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9f76def2-573b-4a5d-dfef-08d850021f8c
X-MS-TrafficTypeDiagnostic: VI1PR04MB6944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB6944A45A128722D6911D03AF8C2C0@VI1PR04MB6944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rd3vyxIL1zvlOWNKijG+iTQLuicmJlPuvLkxY1Y4n+IU4zlK9XrnZ7hY8yOAOblHgJPRa4UwXSjn/PH3DpMr5DlqudZYa/zuBF+TR17pQU2vdvz0Cnq6oRITyzMxFTFmzBCWn3jTvFw52ybMN0Ap+lpA8dSX6ezBiAoiyozbV0cU8xd4XF9nKay2ylrggNP0wRJ3K+EoRB5DuMoLY4lOg21IDdva+1V9556P2K9NEoh7xqo5baqJDpj9t5GQ2T0RhgiyrF1HpSt0fR5F/Q15kFxIXIp58ozOppiyzy9Evoq6s6G432K1vfodt7hrv9BBShx4XFjXpG+/H6l92Qz+5UDB9gglKiz+71D5iDw8hcQ41TGfV04s7Qy0HQowHGSLH1c2xe+ZV+1J5rSjFjE+9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3712.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(478600001)(36756003)(2616005)(6486002)(31686004)(86362001)(110136005)(16576012)(316002)(31696002)(83380400001)(52116002)(956004)(7416002)(2906002)(16526019)(186003)(66946007)(53546011)(26005)(5660300002)(8936002)(66556008)(8676002)(66476007)(44832011)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Srti5ts1LX46sV+V9GrfO6Veegg5VVH4VrOKFqH2AKhLDfI1Dj1a4W43nbf8AD3u8gGbMowP5j1AcsGsJI97Lnk9oGaDdrGA8uyTUFvjIG7Da0ypspwA8TSmND92lxYZfHLGYX5gDddZ8KmV75E5xLFAAw2M1BoC8s88rKJgPXC8XhsgT+AwX+m0jEz7gFPmgAaSOt56VKrPonyzIkPnhdMmoqdqBxGZjTr8P4P0Hxp0BjHuQTquC9UjKANK9+eVAO7vtUUUI/A3um3+m+RqAdSjHbPl8QmNS1eeOyxhrTVn0icMEX47jzTjn7EGC7b3Y8ayOEd8Rb1/lH8ndKmFNM5Wl9u3Kk95RmRn3oNm7mlju2gHCiErLBtRSYBTlHpaQs6afLw7/i7pRm0YKUM9z28xG1Y+rNagAMnOCRoBhJ1MN5jW6nhNll6z17VT+Yh2Frq5ohtAYlcmoD2nCEYbN7xNavWj1bbbIPO/Utek5KMnIub/1qjyXkvNsZRxCVIQ/F6B5QEwkAtILO7DWZmUEPd+fHAZv3g9EbFybOHMkU/ykM+vM6ni+iC7DghjsoYpTHnNANrhZo9yRKGmjHmfBon+olc1t0kYC1O/kAzpO0sBdah6iyW+zo3kIwhCy1E5wmulJDzNqyl9aXJuvMueTA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f76def2-573b-4a5d-dfef-08d850021f8c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3712.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 12:08:52.6125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82FeqdZUHVfB3Nuw0T+owvSmEFkckEYEk7Va2HTxkCwnivy7HBVzdfnEGVhi9ZXLQHqKlll9PSAGNgn76MKaeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944
Subject: Re: [Linux-stm32] [PATCH 1/4] crypto: caam - Fix kerneldoc
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 9/2/2020 6:05 PM, Krzysztof Kozlowski wrote:
> Fix kerneldoc warnings:
> 
>    drivers/crypto/caam/caamalg_qi2.c:73: warning: cannot understand function prototype: 'struct caam_ctx '
>    drivers/crypto/caam/caamalg_qi2.c:2962: warning: cannot understand function prototype: 'struct caam_hash_ctx '
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
This LGTM, but, while here, can you, please, check the other kernel-doc 
warnings:
drivers/crypto/caam/ctrl.c:449: warning: Function parameter or member 
'ctrl' not described in 'caam_get_era'
drivers/crypto/caam/jr.c:331: warning: Function parameter or member 
'rdev' not described in 'caam_jr_free'
drivers/crypto/caam/jr.c:369: warning: Excess function parameter 
'status' description in 'caam_jr_enqueue'
drivers/crypto/caam/caamalg_desc.c:387: warning: Function parameter or 
member 'geniv' not described in 'cnstr_shdsc_aead_decap'

Thanks,
Iulia

>   drivers/crypto/caam/caamalg_qi2.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/caam/caamalg_qi2.c b/drivers/crypto/caam/caamalg_qi2.c
> index 66ae1d581168..0441e4ff2df2 100644
> --- a/drivers/crypto/caam/caamalg_qi2.c
> +++ b/drivers/crypto/caam/caamalg_qi2.c
> @@ -59,7 +59,7 @@ struct caam_skcipher_alg {
>   };
>   
>   /**
> - * caam_ctx - per-session context
> + * struct caam_ctx - per-session context
>    * @flc: Flow Contexts array
>    * @key:  [authentication key], encryption key
>    * @flc_dma: I/O virtual addresses of the Flow Contexts
> @@ -2951,7 +2951,7 @@ enum hash_optype {
>   };
>   
>   /**
> - * caam_hash_ctx - ahash per-session context
> + * struct caam_hash_ctx - ahash per-session context
>    * @flc: Flow Contexts array
>    * @key: authentication key
>    * @flc_dma: I/O virtual addresses of the Flow Contexts
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E368513DA31
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 13:41:58 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 904B7C36B12;
	Thu, 16 Jan 2020 12:41:58 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40055.outbound.protection.outlook.com [40.107.4.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7229C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 11:34:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QlWOAa3vpx6i2cUxKuaDf7IY9qsqLiFQJC5Urz3o9yHg40NYt10LbThCpVVhBPfzyjVXKebzPZZkcp8gTGAUkgR/DP54rsCa83hPiq+wubpSGciEZLWSLAau5pp9mw3tDvAGVt64zuc4nUK+5AFkYq8fk/UaHOEHgG5GbTEL/4q/yJHj3SUNFLwR57NK+uMCljlG986vtqLMiqjwiBN8+DYy7O/yATWLFXC+0GZDYm3RFpU0mjWSW/r/e9FUVnbpvPZgRzYlRSL6om2SvZ4SkqmDxVCUr82EeIj3fKl+3vWlKANhYgIOTHgJNFyr7bYcdWmsVO2QBS97ZR3gj0wwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q1/JPqHG2FO/D0IgadxobMkmPtShYsAvrYP2T6FMW4=;
 b=FmqBbogklhPKkxT2bROK/MhJI62mSSzgdrIcCK/LaU+uEfMXhfw0ujgB9EE3Nz/a4zItLzXq1iOKrJ1/KB5xunzQpxRzSQrS+bJwFDbDNFRSrhYDNw3j/4iQJ9b8m6Q6KzdLPTfywATljEHxphoMW4EM9YOgSRgN4KbdOr/dyQsbNXt3RgN3S9OZ3u9iijZBJUL2LTMRuWJcU+tTFBvCKhdGHyKwOtD59+lJPZd4Z99lUuQO6rpUv8Wb5PbBnyuAmbMRSEELzPpes+RuooYcOrSswLzhReSSq+Yu3kmqnBNJ4kgTG5ZY6lZr+DVNNnXGZzQLXsTfpmj5ZNpwcAzssQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q1/JPqHG2FO/D0IgadxobMkmPtShYsAvrYP2T6FMW4=;
 b=rzN5ARw7nQgWPKlvVjWDJBucT4fMxhAi5Fk9IzA1uFan7TJeqVEjYl/JP+RbzAM25AtLbrcrCscvawTbiKNpS3MvlWzc+/x6sS0rhFg1MZ+a+UCFbKXZIsBea9rE+9qPD7g7F7hSQdzSFPvzdOD6FNla7jziaZGOrlYLOHCYM38=
Received: from VI1PR04MB4445.eurprd04.prod.outlook.com (20.177.55.161) by
 VI1PR04MB7184.eurprd04.prod.outlook.com (10.186.157.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Thu, 16 Jan 2020 11:34:10 +0000
Received: from VI1PR04MB4445.eurprd04.prod.outlook.com
 ([fe80::304d:b7d8:1233:2ae0]) by VI1PR04MB4445.eurprd04.prod.outlook.com
 ([fe80::304d:b7d8:1233:2ae0%6]) with mapi id 15.20.2623.018; Thu, 16 Jan 2020
 11:34:10 +0000
From: Iuliana Prodan <iuliana.prodan@nxp.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>, "alexandre.torgue@st.com"
 <alexandre.torgue@st.com>, "davem@davemloft.net" <davem@davemloft.net>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "wens@csie.org" <wens@csie.org>, Horia Geanta
 <horia.geanta@nxp.com>, Aymen Sghaier <aymen.sghaier@nxp.com>
Thread-Topic: [PATCH RFC 05/10] crypto: engine: transform cur_req in an array
Thread-Index: AQHVyuLoLn4V3kbUsEW/6unpDUGQYQ==
Date: Thu, 16 Jan 2020 11:34:09 +0000
Message-ID: <VI1PR04MB444537D76D295AF3A337039D8C360@VI1PR04MB4445.eurprd04.prod.outlook.com>
References: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
 <20200114135936.32422-6-clabbe.montjoie@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=iuliana.prodan@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 03975f72-c4e3-49d8-e225-08d79a780105
x-ms-traffictypediagnostic: VI1PR04MB7184:|VI1PR04MB7184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB7184B025F84A4A03986102EF8C360@VI1PR04MB7184.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(9686003)(44832011)(8936002)(6636002)(5660300002)(81156014)(81166006)(8676002)(71200400001)(7696005)(4326008)(2906002)(6506007)(316002)(66446008)(66556008)(66476007)(66946007)(64756008)(54906003)(55016002)(110136005)(86362001)(76116006)(478600001)(186003)(53546011)(33656002)(52536014)(26005)(7416002)(91956017);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB7184;
 H:VI1PR04MB4445.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hrBsgrYduZTlWIChCUXQkrx9vs0LT5UeaO21RvKYd/azLeLmiiHaMr2j9oiXfbhE4tDjRa5UlxDhg7DIoB6Am6QLhSJUq4LyM0YPvM22oSZqSRN/n+DK8Ij17xTl9ps/mFqSpeZCvnvqZaDHHJUzsAiLbFrUb7He9BpA4HNES4KgcEUGm2aemzqgQVB95p8tH3L8jhSLiA/TQiDJ3lDJtsB1bQGGVSEET3nZ9U8vR8j7GN6QOklztRHN9F8jdMtWfk9K193s1X8GOr5mZzNQAsOenS2Iba/cCOtP2U9VCYSLgW7kPHN1Nloav+qPCkA0pnWD18/fcTx+X/V+49LdVH4GJZ8FHUcw0gXYjzrnxGDHNas7mvZMkLel7cVgAqLSLTU3rXJ/5+efW/855hC80Sq6GCqLepr8hlidh0NovhEsFsn7vZOe30cWq+p2WfQT
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03975f72-c4e3-49d8-e225-08d79a780105
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 11:34:09.9130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y1C+gGUxK5gPeiss0FxOexpPN9tFL4C2x6P/JIw333VVeD7lG736LpKGR+LH6mcd35FzJihwaCRizUL5db9Qcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7184
X-Mailman-Approved-At: Thu, 16 Jan 2020 12:41:55 +0000
Cc: "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH RFC 05/10] crypto: engine: transform
	cur_req in an array
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

On 1/14/2020 3:59 PM, Corentin Labbe wrote:
> For having the ability of doing a batch of request in one do_one_request(), we
> should be able to store them in an array. (for unpreparing them later).
> This patch converts cur_req in an array of request, but for the moment
> hardcode the maximum to 1.
> 
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>   crypto/crypto_engine.c  | 32 ++++++++++++++++++--------------
>   include/crypto/engine.h | 19 +++++++++++++++----
>   2 files changed, 33 insertions(+), 18 deletions(-)
> 
> diff --git a/crypto/crypto_engine.c b/crypto/crypto_engine.c
> index eb029ff1e05a..b72873550587 100644
> --- a/crypto/crypto_engine.c
> +++ b/crypto/crypto_engine.c
> @@ -30,26 +30,27 @@ static void crypto_finalize_request(struct crypto_engine *engine,
>   	struct crypto_engine_ctx *enginectx;
>   
>   	spin_lock_irqsave(&engine->queue_lock, flags);
> -	if (engine->cur_req == req)
> +	if (engine->cur_reqs[0].req == req)
>   		finalize_cur_req = true;
>   	spin_unlock_irqrestore(&engine->queue_lock, flags);
>   
>   	if (finalize_cur_req) {
> -		enginectx = crypto_tfm_ctx(req->tfm);
> -		if (engine->cur_req_prepared &&
> +		enginectx = crypto_tfm_ctx(engine->cur_reqs[0].req->tfm);
> +		if (engine->cur_reqs[0].prepared &&
>   		    enginectx->op.unprepare_request) {
> -			ret = enginectx->op.unprepare_request(engine, req);
> +			ret = enginectx->op.unprepare_request(engine, engine->cur_reqs[0].req);
>   			if (ret)
>   				dev_err(engine->dev, "failed to unprepare request\n");
>   		}
> +		engine->cur_reqs[0].req->complete(engine->cur_reqs[0].req, err);
>   		spin_lock_irqsave(&engine->queue_lock, flags);
> -		engine->cur_req = NULL;
> -		engine->cur_req_prepared = false;
> +		engine->cur_reqs[0].prepared = false;
> +		engine->cur_reqs[0].req = NULL;
>   		spin_unlock_irqrestore(&engine->queue_lock, flags);
> +	} else {
> +		req->complete(req, err);
>   	}
>   
> -	req->complete(req, err);
> -
>   	kthread_queue_work(engine->kworker, &engine->pump_requests);
>   }
>   
> @@ -74,7 +75,7 @@ static void crypto_pump_requests(struct crypto_engine *engine,
>   	spin_lock_irqsave(&engine->queue_lock, flags);
>   
>   	/* Make sure we are not already running a request */
> -	if (engine->cur_req)
> +	if (engine->cur_reqs[0].req)
>   		goto out;
>   
>   	/* If another context is idling then defer */
> @@ -114,7 +115,7 @@ static void crypto_pump_requests(struct crypto_engine *engine,
>   	if (!async_req)
>   		goto out;
>   
> -	engine->cur_req = async_req;
> +	engine->cur_reqs[0].req = async_req;
>   	if (backlog)
>   		backlog->complete(backlog, -EINPROGRESS);
>   
> @@ -143,14 +144,14 @@ static void crypto_pump_requests(struct crypto_engine *engine,
>   				ret);
>   			goto req_err;
>   		}
> -		engine->cur_req_prepared = true;
> +		engine->cur_reqs[0].prepared = true;
>   	}
>   	if (!enginectx->op.do_one_request) {
>   		dev_err(engine->dev, "failed to do request\n");
>   		ret = -EINVAL;
>   		goto req_err;
>   	}
> -	ret = enginectx->op.do_one_request(engine, async_req);
> +	ret = enginectx->op.do_one_request(engine, engine->cur_reqs[0].req);
>   	if (ret) {
>   		dev_err(engine->dev, "Failed to do one request from queue: %d\n", ret);
>   		goto req_err;
> @@ -158,7 +159,7 @@ static void crypto_pump_requests(struct crypto_engine *engine,
>   	return;
>   
>   req_err:
> -	crypto_finalize_request(engine, async_req, ret);
> +	crypto_finalize_request(engine, engine->cur_reqs[0].req, ret);
>   	return;
>   
>   out:
> @@ -411,10 +412,13 @@ struct crypto_engine *crypto_engine_alloc_init(struct device *dev, bool rt)
>   	engine->running = false;
>   	engine->busy = false;
>   	engine->idling = false;
> -	engine->cur_req_prepared = false;
>   	engine->priv_data = dev;
>   	snprintf(engine->name, sizeof(engine->name),
>   		 "%s-engine", dev_name(dev));
> +	engine->rmax = 1;
> +	engine->cur_reqs = devm_kzalloc(dev, sizeof(struct cur_req) * engine->rmax, GFP_KERNEL);
> +	if (!engine->cur_reqs)
> +		return NULL;
>   
>   	crypto_init_queue(&engine->queue, CRYPTO_ENGINE_MAX_QLEN);
>   	spin_lock_init(&engine->queue_lock);
> diff --git a/include/crypto/engine.h b/include/crypto/engine.h
> index e29cd67f93c7..362134e226f4 100644
> --- a/include/crypto/engine.h
> +++ b/include/crypto/engine.h
> @@ -18,13 +18,23 @@
>   #include <crypto/skcipher.h>
>   
>   #define ENGINE_NAME_LEN	30
> +
> +/*
> + * struct cur_req - Represent a request to be processed
> + * @prepared:	Does the request was prepared
> + * @req:	The request to be processed
> + */
> +struct cur_req {
> +	bool				prepared;
> +	struct crypto_async_request	*req;
> +};
> +
>   /*
>    * struct crypto_engine - crypto hardware engine
>    * @name: the engine name
>    * @idling: the engine is entering idle state
>    * @busy: request pump is busy
>    * @running: the engine is on working
> - * @cur_req_prepared: current request is prepared
>    * @list: link with the global crypto engine list
>    * @queue_lock: spinlock to syncronise access to request queue
>    * @queue: the crypto queue of the engine
> @@ -38,14 +48,14 @@
>    * @kworker: kthread worker struct for request pump
>    * @pump_requests: work struct for scheduling work to the request pump
>    * @priv_data: the engine private data
> - * @cur_req: the current request which is on processing
> + * @rmax:	The number of request which can be processed in one batch
> + * @cur_reqs: 	A list for requests to be processed
>    */
>   struct crypto_engine {
>   	char			name[ENGINE_NAME_LEN];
>   	bool			idling;
>   	bool			busy;
>   	bool			running;
> -	bool			cur_req_prepared;
>   
>   	struct list_head	list;
>   	spinlock_t		queue_lock;
> @@ -61,7 +71,8 @@ struct crypto_engine {
>   	struct kthread_work             pump_requests;
>   
>   	void				*priv_data;
> -	struct crypto_async_request	*cur_req;
> +	int 				rmax;
> +	struct cur_req 			*cur_reqs;
>   };

To keep requests independent IMO it would be best to have a list of 
requests like: struct requests run_queue, where

struct requests {
	unsigned int max_no_reqs;
	unsigned int current_no_reqs;
	struct cur_req *cur_reqs; //list of the requests
} run_queue;
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

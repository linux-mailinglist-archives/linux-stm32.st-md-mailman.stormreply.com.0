Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23DA4565D
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 08:07:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D375C7A82F;
	Wed, 26 Feb 2025 07:07:28 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32781C7A82E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 07:07:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMX2Qe011930;
 Wed, 26 Feb 2025 07:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 F7MIpx44Gj5enmHF9B2AM5F5bduKIt2BmivQCHi/jfA=; b=QlRsrQZaPcdqcfJC
 WOBd907LSofhHZILplJfXXLSa1EVQdV0+OR0z2YXHlPpjf/aXH2/2oNmm2DC2crs
 Kl6mUOglWCMmj4jJMExW0C/ebFq2zhp2uD7dYsuUB9s22Sj3KM5awVzuMS8u3npY
 XqoOYPx3QsrGYfchosHZDwYfINJbMa3TLniL5+MElMxeAkIKlNRe3uJR/MOnGJRW
 0q3IwMtBMXvjvoHiFyzP4u/EJzvfjUm/p9ajLVv4AJxa76akC88cNzP99O5nL1OV
 7DUCBST0qNdeX7l+r6nOykDlzp5DDZp5Q9EV8skKeCqfGqmO9ryZZ6TJ/vIk3blr
 +ze+kw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prk92v8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 07:07:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q77CLa015990
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Feb 2025 07:07:12 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Feb
 2025 23:07:07 -0800
Message-ID: <2d16609b-2423-489e-a45c-0e73ee9af006@quicinc.com>
Date: Wed, 26 Feb 2025 15:07:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250226041342.53933-1-quic_jiegan@quicinc.com>
 <20250226041342.53933-6-quic_jiegan@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250226041342.53933-6-quic_jiegan@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sE1QsX_3kYUv6bDqm3J0z-mkWUDmhznT
X-Proofpoint-ORIG-GUID: sE1QsX_3kYUv6bDqm3J0z-mkWUDmhznT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260055
Cc: devicetree@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v14 05/10] Coresight: Allocate trace ID
 after building the path
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



On 2/26/2025 12:13 PM, Jie Gan wrote:
> The trace_id will be stored in coresight_path instead of being declared
> everywhere and allocated after building the path.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>

Correct tags:
Co-developed-by: James Clark <james.clark@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>

Jie

> ---
>   drivers/hwtracing/coresight/coresight-core.c  | 44 +++++++++++++++++++
>   .../hwtracing/coresight/coresight-etm-perf.c  |  5 +--
>   drivers/hwtracing/coresight/coresight-priv.h  |  2 +
>   drivers/hwtracing/coresight/coresight-sysfs.c |  4 ++
>   4 files changed, 52 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 9c2a088a28d8..7d010d996f01 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -654,6 +654,50 @@ static void coresight_drop_device(struct coresight_device *csdev)
>   	}
>   }
>   
> +/*
> + * coresight device will read their existing or alloc a trace ID, if their trace_id
> + * callback is set.
> + *
> + * Return 0 if the trace_id callback is not set.
> + * Return the result of the trace_id callback if it is set. The return value
> + * will be the trace_id if successful, and an error number if it fails.
> + */
> +static int coresight_get_trace_id(struct coresight_device *csdev,
> +				  enum cs_mode mode,
> +				  struct coresight_device *sink)
> +{
> +	if (coresight_ops(csdev)->trace_id)
> +		return coresight_ops(csdev)->trace_id(csdev, mode, sink);
> +
> +	return 0;
> +}
> +
> +/*
> + * Call this after creating the path and before enabling it. This leaves
> + * the trace ID set on the path, or it remains 0 if it couldn't be assigned.
> + */
> +void coresight_path_assign_trace_id(struct coresight_path *path,
> +				    enum cs_mode mode)
> +{
> +	struct coresight_device *sink = coresight_get_sink(&path->path_list);
> +	struct coresight_node *nd;
> +	int trace_id;
> +
> +	list_for_each_entry(nd, &path->path_list, link) {
> +		/* Assign a trace ID to the path for the first device that wants to do it */
> +		trace_id = coresight_get_trace_id(nd->csdev, mode, sink);
> +
> +		/*
> +		 * 0 in this context is that it didn't want to assign so keep searching.
> +		 * Non 0 is either success or fail.
> +		*/
> +		if (trace_id != 0) {
> +			path->trace_id = trace_id;
> +			return;
> +		}
> +	}
> +}
> +
>   /**
>    * _coresight_build_path - recursively build a path from a @csdev to a sink.
>    * @csdev:	The device to start from.
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index b0426792f08a..134290ab622e 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -319,7 +319,6 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   {
>   	u32 id, cfg_hash;
>   	int cpu = event->cpu;
> -	int trace_id;
>   	cpumask_t *mask;
>   	struct coresight_device *sink = NULL;
>   	struct coresight_device *user_sink = NULL, *last_sink = NULL;
> @@ -409,8 +408,8 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   		}
>   
>   		/* ensure we can allocate a trace ID for this CPU */
> -		trace_id = coresight_trace_id_get_cpu_id_map(cpu, &sink->perf_sink_id_map);
> -		if (!IS_VALID_CS_TRACE_ID(trace_id)) {
> +		coresight_path_assign_trace_id(path, CS_MODE_PERF);
> +		if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
>   			cpumask_clear_cpu(cpu, mask);
>   			coresight_release_path(path);
>   			continue;
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 27b7dc348d4a..2bea35bae0d4 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -152,6 +152,8 @@ int coresight_make_links(struct coresight_device *orig,
>   void coresight_remove_links(struct coresight_device *orig,
>   			    struct coresight_connection *conn);
>   u32 coresight_get_sink_id(struct coresight_device *csdev);
> +void coresight_path_assign_trace_id(struct coresight_path *path,
> +				   enum cs_mode mode);
>   
>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>   extern int etm_readl_cp14(u32 off, unsigned int *val);
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index cb4c39732d26..d03751bf3d8a 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -209,6 +209,10 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   		goto out;
>   	}
>   
> +	coresight_path_assign_trace_id(path, CS_MODE_SYSFS);
> +	if (!IS_VALID_CS_TRACE_ID(path->trace_id))
> +		goto err_path;
> +
>   	ret = coresight_enable_path(&path->path_list, CS_MODE_SYSFS, NULL);
>   	if (ret)
>   		goto err_path;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

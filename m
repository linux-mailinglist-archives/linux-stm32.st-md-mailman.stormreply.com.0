Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FD994845
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 14:11:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C51EC7128F;
	Tue,  8 Oct 2024 12:11:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC89BC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 12:11:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984SZZS008682;
 Tue, 8 Oct 2024 12:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O+rPNhVOLSMm6I9uahJ9YI6EVuw1ePfuGwHF63aq4rE=; b=lEoKnBM683EURTz4
 vk38N/5ycM7j892E/bnfqsDuwTzysWdNcKhJ/neGSeqHdtbsF2AVJhdlq1GQUMoT
 md5ZhuMmZt9u22OV/cK+JtGaAjvvGquWDe8NRul26MAztH9hyFJzuU7Kwn7jDgzW
 qZ9uIu+0ZSq/ZWUZ+2+I4bMUoLVVRyqc24V7448wVuOrCYBAbx1snogaxxmt1O0R
 rn6l8iR5FJXATmipaqtXbQSoOjmDNSv6SyO/W5dB2oeTeY8QoBdhCvMYfymNO4Zu
 DRmmektKHEywahioj34VlPb4HWljbLY/ko9TSuCb+wJecIC7B8bEzf129jEzcnZd
 m1RZwg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wrc164x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 12:10:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 498CAwBl002123
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 8 Oct 2024 12:10:58 GMT
Received: from [10.50.59.162] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Oct 2024
 05:10:49 -0700
Message-ID: <3e765e56-0e5c-4117-88c9-37a8c1cffbea@quicinc.com>
Date: Tue, 8 Oct 2024 17:40:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Horman <horms@kernel.org>, Suraj Jaiswal <quic_jsuraj@quicinc.com>
References: <20240910124841.2205629-1-quic_jsuraj@quicinc.com>
 <20240910124841.2205629-2-quic_jsuraj@quicinc.com>
 <20240912084710.GE572255@kernel.org>
Content-Language: en-US
From: Sarosh Hasan <quic_sarohasa@quicinc.com>
In-Reply-To: <20240912084710.GE572255@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: tbba8WbgboOB6VR4jTA7KWrIwbtPRhrN
X-Proofpoint-ORIG-GUID: tbba8WbgboOB6VR4jTA7KWrIwbtPRhrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1011 spamscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080076
Cc: Rob Herring <robh@kernel.org>, kernel@quicinc.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Prasad Sodagudi <psodagud@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: allocate separate page
	for buffer
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



On 9/12/2024 2:17 PM, Simon Horman wrote:
> On Tue, Sep 10, 2024 at 06:18:41PM +0530, Suraj Jaiswal wrote:
>> Currently for TSO page is mapped with dma_map_single()
>> and then resulting dma address is referenced (and offset)
>> by multiple descriptors until the whole region is
>> programmed into the descriptors.
>> This makes it possible for stmmac_tx_clean() to dma_unmap()
>> the first of the already processed descriptors, while the
>> rest are still being processed by the DMA engine. This leads
>> to an iommu fault due to the DMA engine using unmapped memory
>> as seen below:
>>
>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>> iova=0xfc401000, fsynr=0x60003, cbfrsynra=0x121, cb=38
>>
>> Descriptor content:
>>      TDES0       TDES1   TDES2   TDES3
>> 317: 0xfc400800  0x0     0x36    0xa02c0b68
>> 318: 0xfc400836  0x0     0xb68   0x90000000
>>
>> As we can see above descriptor 317 holding a page address
>> and 318 holding the buffer address by adding offset to page
>> addess. Now if 317 descritor is cleaned as part of tx_clean()
> 
> Hi Suraj,
> 
> As it looks like there will be a v3 anyway, some minor nits from my side.
> 
> addess -> address
> 
> Flagged by checkpatch.pl --codespell
sure . we will take care of all commnet and update latest patch after verification . 
> 
>> then we will get SMMU fault if 318 descriptor is getting accessed.
>>
>> To fix this, let's map each descriptor's memory reference individually.
>> This way there's no risk of unmapping a region that's still being
>> referenced by the DMA engine in a later descriptor.
>>
>> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
>> ---
>>
>> Changes since v2:
>> - Update commit text with more details.
>> - fixed Reverse xmas tree order issue.
>>
>>
>> Changes since v1:
>> - Fixed function description 
>> - Fixed handling of return value.
>>
>>
>>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 63 ++++++++++++-------
>>  1 file changed, 42 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 83b654b7a9fd..98d5a4b64cac 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -4136,21 +4136,25 @@ static bool stmmac_vlan_insert(struct stmmac_priv *priv, struct sk_buff *skb,
>>  /**
>>   *  stmmac_tso_allocator - close entry point of the driver
>>   *  @priv: driver private structure
>> - *  @des: buffer start address
>> + *  @addr: Contains either skb frag address or skb->data address
>>   *  @total_len: total length to fill in descriptors
>>   *  @last_segment: condition for the last descriptor
>>   *  @queue: TX queue index
>> + * @is_skb_frag: condition to check whether skb data is part of fragment or not
>>   *  Description:
>>   *  This function fills descriptor and request new descriptors according to
>>   *  buffer length to fill
>> + *  This function returns 0 on success else -ERRNO on fail
> 
> Please consider using a "Return:" or "Returns:" section to document
> return values.
> 
> Flagged by ./scripts/kernel-doc -none -Wall .../stmmac_main.c
> 
>>   */
>> -static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
>> -				 int total_len, bool last_segment, u32 queue)
>> +static int stmmac_tso_allocator(struct stmmac_priv *priv, void *addr,
>> +				int total_len, bool last_segment, u32 queue, bool is_skb_frag)
> 
> The line above could be trivially wrapped to <= 80 columns wide, as is
> still preferred for networking code. Likewise a little further below.
> 
> Likewise elsewhere in this patch.
> 
> You can pass an option to checkpatch.pl to check for this.
> 
>>  {
>>  	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
>>  	struct dma_desc *desc;
>>  	u32 buff_size;
>>  	int tmp_len;
>> +	unsigned char *data = addr;
>> +	unsigned int offset = 0;
> 
> Please consider arranging local variables in Networking code in
> reverse xmas tree order - longest line to shortest.
> 
> Edward Cree's xmastree tool can be of assistance here:
> https://github.com/ecree-solarflare/xmastree
> 
>>  
>>  	tmp_len = total_len;
>>  
>> @@ -4161,20 +4165,44 @@ static void stmmac_tso_allocator(struct stmmac_priv *priv, dma_addr_t des,
>>  						priv->dma_conf.dma_tx_size);
>>  		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
>>  
>> +		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ? TSO_MAX_BUFF_SIZE : tmp_len;
> 
> 		FWIIW, I think that min() would allow this the intent
> 		of the line above to be expressed more succinctly.
> 
>> +
>>  		if (tx_q->tbs & STMMAC_TBS_AVAIL)
>>  			desc = &tx_q->dma_entx[tx_q->cur_tx].basic;
>>  		else
>>  			desc = &tx_q->dma_tx[tx_q->cur_tx];
>>  
>> -		curr_addr = des + (total_len - tmp_len);
>> +		offset = total_len - tmp_len;
>> +		if (!is_skb_frag) {
>> +			curr_addr = dma_map_single(priv->device, data + offset, buff_size,
>> +						   DMA_TO_DEVICE);
>> +
>> +			if (dma_mapping_error(priv->device, curr_addr))
>> +				return -ENOMEM;
>> +
>> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = curr_addr;
>> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].len = buff_size;
>> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = false;
>> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
>> +		} else {
>> +			curr_addr = skb_frag_dma_map(priv->device, addr, offset,
>> +						     buff_size,
>> +						     DMA_TO_DEVICE);
>> +
>> +			if (dma_mapping_error(priv->device, curr_addr))
>> +				return -ENOMEM;
>> +
>> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf = curr_addr;
>> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].len = buff_size;
>> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].map_as_page = true;
>> +			tx_q->tx_skbuff_dma[tx_q->cur_tx].buf_type = STMMAC_TXBUF_T_SKB;
>> +		}
> 
> Maybe my eyes are deceiving me, but there seems to be quite a lot of
> repetition in the two arms of the if/else condition above. If so, can it be
> consolidated by moving everything other than the assignment of curr out of
> the conditional blocks?  (And dropping the {}.)
> 
>> +
>>  		if (priv->dma_cap.addr64 <= 32)
>>  			desc->des0 = cpu_to_le32(curr_addr);
>>  		else
>>  			stmmac_set_desc_addr(priv, desc, curr_addr);
>>  
>> -		buff_size = tmp_len >= TSO_MAX_BUFF_SIZE ?
>> -			    TSO_MAX_BUFF_SIZE : tmp_len;
>> -
>>  		stmmac_prepare_tso_tx_desc(priv, desc, 0, buff_size,
>>  				0, 1,
>>  				(last_segment) && (tmp_len <= TSO_MAX_BUFF_SIZE),
> 
> ...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

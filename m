Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E751252886
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Aug 2020 09:42:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37889C32E90;
	Wed, 26 Aug 2020 07:42:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7878CC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Aug 2020 07:42:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07Q7fYFm027838; Wed, 26 Aug 2020 09:42:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=iMMB81vKFOkSeOwydW9I3L8tM5JTQ3Bi1g6MGR42Q3s=;
 b=1Wyig3H3hCS4pdWa+gAAR4/CfTFUKMFzebCui0W8/4+WPwyTdWx1W9bB1YUbGWqCoOrl
 fPL5SAyvgQVk87ikh4WDqZnG8I9G6VolxdduZl8BTYTxPqcRZ3kjbAj2uWuj5uTEtBoy
 paokbofnTSM+IJXZezxrh3pfOYIZm/LCZOeGlY3D5gwkQGHv+oMNIksNIhYxdz1+brwt
 gGCa51fQ9Y8h7nQpW533LwDFRyFHBpuT+j2onh/+qQPGH//VeLmI5ecDB0VksSJKQf7z
 46+qPXAoONOatPGR+FpN4+pWIhuQmIEllbtaqIqFGgbqoXOGR0ZKLoA8/6wsA0uUc2Nh Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b3hf476-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 09:42:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6495210002A;
 Wed, 26 Aug 2020 09:42:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 571A021263E;
 Wed, 26 Aug 2020 09:42:48 +0200 (CEST)
Received: from lmecxl0889.tpe.st.com (10.75.127.48) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Aug
 2020 09:42:47 +0200
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200731114732.12815-1-arnaud.pouliquen@st.com>
 <20200731114732.12815-9-arnaud.pouliquen@st.com>
 <20200825165433.GA4141387@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <c1b81b38-c155-3183-ed67-822c4f87ec71@st.com>
Date: Wed, 26 Aug 2020 09:42:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200825165433.GA4141387@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_03:2020-08-25,
 2020-08-26 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 8/9] rpmsg: virtio: use rpmsg_ns driver to
 manage ns announcement
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

Hi mathieu,

I Sent my V2 few seconds before receiving your comment :)
Please find my answer below

On 8/25/20 6:54 PM, Mathieu Poirier wrote:
> Hi Arnaud,
> 
> On Fri, Jul 31, 2020 at 01:47:31PM +0200, Arnaud Pouliquen wrote:
>> Use the new rpmsg_ns API to send the name service announcements if
>> the VIRTIO_RPMSG_F_NS is set, else just not implement the ops.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
>> ---
>>  drivers/rpmsg/virtio_rpmsg_bus.c | 94 +++++---------------------------
>>  1 file changed, 13 insertions(+), 81 deletions(-)
>>
>> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
>> index f771fdae150e..3c771a6392be 100644
>> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
>> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
>> @@ -91,35 +91,6 @@ struct rpmsg_hdr {
>>  	u8 data[];
>>  } __packed;
>>  
>> -/**
>> - * struct rpmsg_ns_msg - dynamic name service announcement message
>> - * @name: name of remote service that is published
>> - * @addr: address of remote service that is published
>> - * @flags: indicates whether service is created or destroyed
>> - *
>> - * This message is sent across to publish a new service, or announce
>> - * about its removal. When we receive these messages, an appropriate
>> - * rpmsg channel (i.e device) is created/destroyed. In turn, the ->probe()
>> - * or ->remove() handler of the appropriate rpmsg driver will be invoked
>> - * (if/as-soon-as one is registered).
>> - */
>> -struct rpmsg_ns_msg {
>> -	char name[RPMSG_NAME_SIZE];
>> -	__virtio32 addr;
>> -	__virtio32 flags;
>> -} __packed;
>> -
>> -/**
>> - * enum rpmsg_ns_flags - dynamic name service announcement flags
>> - *
>> - * @RPMSG_NS_CREATE: a new remote service was just created
>> - * @RPMSG_NS_DESTROY: a known remote service was just destroyed
>> - */
>> -enum rpmsg_ns_flags {
>> -	RPMSG_NS_CREATE		= 0,
>> -	RPMSG_NS_DESTROY	= 1,
>> -};
>> -
>>  /**
>>   * @vrp: the remote processor this channel belongs to
>>   */
>> @@ -324,60 +295,18 @@ static void virtio_rpmsg_destroy_ept(struct rpmsg_endpoint *ept)
>>  	__rpmsg_destroy_ept(vch->vrp, ept);
>>  }
>>  
>> -static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
>> -{
>> -	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>> -	struct virtproc_info *vrp = vch->vrp;
>> -	struct device *dev = &rpdev->dev;
>> -	int err = 0;
>> -
>> -	/* need to tell remote processor's name service about this channel ? */
>> -	if (rpdev->announce && rpdev->ept &&
>> -	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
>> -		struct rpmsg_ns_msg nsm;
>> -
>> -		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
>> -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
>> -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_CREATE);
>> -
>> -		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>> -		if (err)
>> -			dev_err(dev, "failed to announce service %d\n", err);
>> -	}
>> -
>> -	return err;
>> -}
>> -
>> -static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
>> -{
>> -	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>> -	struct virtproc_info *vrp = vch->vrp;
>> -	struct device *dev = &rpdev->dev;
>> -	int err = 0;
>> -
>> -	/* tell remote processor's name service we're removing this channel */
>> -	if (rpdev->announce && rpdev->ept &&
>> -	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
>> -		struct rpmsg_ns_msg nsm;
>> -
>> -		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
>> -		nsm.addr = cpu_to_virtio32(vrp->vdev, rpdev->ept->addr);
>> -		nsm.flags = cpu_to_virtio32(vrp->vdev, RPMSG_NS_DESTROY);
>> -
>> -		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
>> -		if (err)
>> -			dev_err(dev, "failed to announce service %d\n", err);
>> -	}
>> -
>> -	return err;
>> -}
>> -
>>  static const struct rpmsg_device_ops virtio_rpmsg_ops = {
>>  	.create_channel = virtio_rpmsg_create_channel,
>>  	.release_channel = virtio_rpmsg_release_channel,
>>  	.create_ept = virtio_rpmsg_create_ept,
>> -	.announce_create = virtio_rpmsg_announce_create,
>> -	.announce_destroy = virtio_rpmsg_announce_destroy,
>> +};
>> +
>> +static const struct rpmsg_device_ops virtio_rpmsg_w_nsa_ops = {
>> +	.create_channel = virtio_rpmsg_create_channel,
>> +	.release_channel = virtio_rpmsg_release_channel,
>> +	.create_ept = virtio_rpmsg_create_ept,
>> +	.announce_create = rpmsg_ns_announce_create,
>> +	.announce_destroy = rpmsg_ns_announce_destroy,
>>  };
>>  
>>  static void virtio_rpmsg_release_device(struct device *dev)
>> @@ -423,7 +352,10 @@ __rpmsg_create_channel(struct virtproc_info *vrp,
>>  	rpdev = &vch->rpdev;
>>  	rpdev->src = chinfo->src;
>>  	rpdev->dst = chinfo->dst;
>> -	rpdev->ops = &virtio_rpmsg_ops;
>> +	if (virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS))
>> +		rpdev->ops = &virtio_rpmsg_w_nsa_ops;
>> +	else
>> +		rpdev->ops = &virtio_rpmsg_ops;
> 
> Yesterday I struggled with this part and I still do this morning.  Function
> __rpmsg_create_channel() can only be called if VIRTIO_RPMSG_F_NS is set so there
> is no need to check it again.

That's right if rpmsg_create_channel is called by the rpmsg_ns only. But it 
could not be the case in future, for instance with the rpmsg_ctrl series [1]
As the channel creation is decorrelate from the ns annoucement we need to check it.

[1]https://patchwork.kernel.org/patch/11694787/

I would also have expected this patch to be a
> simple replace of the .announce_create/destroy functions.  Adding an ops that
> doesn't have the .announce_create/destroy functions looks like a feature to me,
> and one that I don't quite get.
> 
> Do you think you could expand on the motivation behind this patch?

It was my first implementation. It is more of a phylosophical point than anything else.
With this path i tried to implement the following rule:
  if VIRTIO_RPMSG_F_NS is not set
      no ns announcement support
  else 
      delegate to the ns announcement RPMsg service

Rather, legacy implementation is about to implement the announce ops even if not supported.

If this implementation is confusing i can go back to my first implementation which was
only an update the virtio_rpmsg_announce_xx functions:

@@ -322,15 +304,8 @@ static int virtio_rpmsg_announce_create(struct rpmsg_device *rpdev)
 	int err = 0;
 
 	/* need to tell remote processor's name service about this channel ? */
-	if (rpdev->announce && rpdev->ept &&
-	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
-		struct rpmsg_ns_msg nsm;
-
-		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = rpdev->ept->addr;
-		nsm.flags = RPMSG_NS_CREATE;
-
-		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
+	if (virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
+		err = rpmsg_ctrl_channel_announce(rpdev, RPMSG_NS_CREATE);
 		if (err)
 			dev_err(dev, "failed to announce service %d\n", err);
 	}
@@ -346,15 +321,8 @@ static int virtio_rpmsg_announce_destroy(struct rpmsg_device *rpdev)
 	int err = 0;
 
 	/* tell remote processor's name service we're removing this channel */
-	if (rpdev->announce && rpdev->ept &&
-	    virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
-		struct rpmsg_ns_msg nsm;
-
-		strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
-		nsm.addr = rpdev->ept->addr;
-		nsm.flags = RPMSG_NS_DESTROY;
-
-		err = rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR);
+	if (virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
+		err = rpmsg_ctrl_channel_announce(rpdev, RPMSG_NS_DESTROY);
 		if (err)
 			dev_err(dev, "failed to announce service %d\n", err);
 	}

Regards,
Arnaud

> 
> Thanks,
> Mathieu 
> 
>>  
>>  	/*
>>  	 * rpmsg server channels has predefined local address (for now),
>> @@ -933,7 +865,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
>>  
>>  		/* Assign public information to the rpmsg_device */
>>  		rpdev_ns = &vch->rpdev;
>> -		rpdev_ns->ops = &virtio_rpmsg_ops;
>> +		rpdev_ns->ops = &virtio_rpmsg_w_nsa_ops;
>>  
>>  		rpdev_ns->dev.parent = &vrp->vdev->dev;
>>  		rpdev_ns->dev.release = virtio_rpmsg_release_device;
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
